class UsersController < ApplicationController
  before_filter :auth_user, only: [:show, :edit, :update, :destroy, :following, :followers]
  before_filter :correct_user,   only: [:edit, :destroy]
  
  def index
    @users = User.all
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end
  
  def show
    @user = User.find(params[:id])
    @activities = PublicActivity::Activity.order("created_at desc").where(owner_id: current_user, owner_type: "User")
    @projects = @user.projects
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end
  
  def edit
    @user = User.find(params[:id])
    
    respond_to do |format|
      format.html # edit.html.erb
      format.json { render json: @user }
    end
  end
  
  def update
    @user = User.find(params[:id])
    
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'Your profile was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @user = User.find(params[:id]).destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :ok }
    end
  end
  
  def following
    @user = User.find(params[:id])
    @users = @user.followed_users
    render 'show_following'
  end
  
  def followers
    @user = User.find(params[:id])
    @users = @user.followers
    render 'show_followers'
  end
  
  
  private

    def correct_user
      @user = User.find(params[:id])
      if @user != current_user
        redirect_to root_path, alert: "You do not have access to that page."
      end
    end
end
