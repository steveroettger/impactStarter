class Objective < ActiveRecord::Base
  
  attr_accessible :content, :project_id
  
  # RELATIONSHIPS
  belongs_to :project
  
end
