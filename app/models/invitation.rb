class Invitation < ActiveRecord::Base
  attr_accessor :full_name
  attr_accessible :message, :full_name, :linkedin_id

  belongs_to :owner, class_name: "User"
  belongs_to :invitee, class_name: "User"

  scope :active, proc{ where(delivered_at: nil) }

  validates :linkedin_id, presence: true
  validates :message,     presence: true
  validates :owner,       presence: true

  def message_with_url(url)
    Liquid::Template.parse(message.to_s).render 'signup' => url
  rescue Liquid::Error
  end

  validate :validate_has_url_tag

  def validate_has_url_tag
    add_error = lambda{ errors.add "message", "must contain {{signup}} link" }
    expected = "~~LINK~~"
    test = message_with_url(expected).to_s
    add_error.call unless test.include?(expected)
  rescue Liquid::Error
    add_error.call
  end

end
