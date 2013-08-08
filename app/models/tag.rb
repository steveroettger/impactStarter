class Tag < ActiveRecord::Base
  
  attr_accessible :name
  
  # RELATIONSHIPS
  belongs_to :project
  
end
