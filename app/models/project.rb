class Project < ActiveRecord::Base
  attr_accessible :title, :organization, :description, :image, :video_url, :status
  
  mount_uploader :image, ImageUploader
  
  # RELATIONSHIPS
  belongs_to :user
  has_many :project_objectives
  
end
