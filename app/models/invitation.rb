class Invitation < ActiveRecord::Base
  attr_accessor :full_name
  attr_accessible :message, :full_name, :linkedin_id

  belongs_to :owner, class_name: "User"
  belongs_to :invitee, class_name: "User"

  scope :unaccepted, proc{ where(accepted_at: nil) }

  validates :linkedin_id, presence: true
  validates :message,     presence: true
  validates :owner,       presence: true
  validates :public_id,   presence: true, uniqueness: true

  validate :validate_has_url_tag

  def validate_has_url_tag
    add_error = lambda{ errors.add "message", "must contain {{signup}} link" }
    expected = "~~LINK~~"
    test = message_with_url(expected).to_s
    add_error.call unless test.include?(expected)
  rescue Liquid::Error
    add_error.call
  end

  def message_with_url(url)
    Liquid::Template.parse(message.to_s).render 'signup' => url
  rescue Liquid::Error
  end

  def public_id
    self[:public_id] ||= self.class.generate_public_id
  end

  def to_param
    public_id
  end

  def public_id_taken?
    errors[:public_id].include?(errors.generate_message(:public_id, :taken))
  end

  def accept(user)
    self.invitee = user
    self.accepted_at = Time.now
    save
  end

  def self.generate_public_id
    Base32::Crockford.encode(rand(999_999_999))
  end
end
