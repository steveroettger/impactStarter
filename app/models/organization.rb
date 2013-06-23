class Organization < ActiveRecord::Base
  attr_accessible :name, :address, :city, :state, :entity_type, :tax_status, :logo
  
  mount_uploader :logo, ImageUploader
end
