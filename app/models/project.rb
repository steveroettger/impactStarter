class Project < ActiveRecord::Base
  attr_accessible :title, :description, :image, :video_url, :status, :objectives_attributes
  
  # CARRIERWAVE IMAGE UPLOADER
  mount_uploader :image, ImageUploader
  
  # RELATIONSHIPS
  belongs_to :user
  has_many :objectives, dependent: :destroy
  accepts_nested_attributes_for :objectives, allow_destroy: true, reject_if: :all_blank
  
  # VALIDATIONS
  validates :user_id, presence: true  
  
end
