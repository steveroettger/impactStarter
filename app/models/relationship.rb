class Relationship < ActiveRecord::Base
  include PublicActivity::Common
  #tracked owner: ->(controller, model) { controller && controller.current_user }
  #tracked recipient: ->(controller, model) { model && model.current_user }
  
  attr_accessible :followed_id
  
  # RELATIONSHIPS
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"
  
  #VALIDATIONS
  validates :follower_id, presence: true
  validates :followed_id, presence: true
  
end
