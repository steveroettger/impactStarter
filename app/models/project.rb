class Project < ActiveRecord::Base
  attr_accessible :title, :seeking_amount, :funded_amount, :description, :image, :video_url, :status, :objectives_attributes, :tags_attributes
  
  # CARRIERWAVE IMAGE UPLOADER
  mount_uploader :image, ImageUploader
  
  # RELATIONSHIPS
  belongs_to :owner, class_name: "User", foreign_key: "user_id"
  has_many :objectives, dependent: :destroy
  has_many :tags, dependent: :destroy
  
  accepts_nested_attributes_for :objectives, allow_destroy: true, reject_if: :all_blank
  accepts_nested_attributes_for :tags, allow_destroy: true, reject_if: :all_blank
  
  # VALIDATIONS
  validates :user_id, presence: true  
  
end
