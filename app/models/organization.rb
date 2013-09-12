class Organization < ActiveRecord::Base
  attr_accessible :name, :description, :address, :city, :state, :entity_type, :tax_status, :image

  mount_uploader :image, ImageUploader

  # RELATIONSHIPS
  belongs_to :director, class_name: "User", foreign_key: "user_id"

  # VALIDATIONS
  validates :user_id, presence: true

  filter_by :name
end
