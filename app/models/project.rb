class Project < ActiveRecord::Base
  attr_accessible :title, :organization, :description, :image, :video_url
  
end
