class Objective < ActiveRecord::Base
  
  attr_accessible :content
  
  # RELATIONSHIPS
  belongs_to :project
  
end
