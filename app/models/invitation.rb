class Invitation < ActiveRecord::Base
  attr_accessor :full_name
  attr_accessible :message, :full_name, :linkedin_id

  belongs_to :owner, class_name: "User"
  belongs_to :invitee, class_name: "User"

  scope :active, proc{ where(delivered_at: nil) }

  validates :linkedin_id, presence: true
  validates :message,     presence: true
  validates :owner,       presence: true
end
