class ActivitiesController < ApplicationController
  
  def index
    @user = User.find(params[:id])
    @activities = PublicActivity::Activity.order("created_at desc").where(owner_id: @user, owner_type: "User")
  end
  
end
