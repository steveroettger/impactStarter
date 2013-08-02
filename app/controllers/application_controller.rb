class ApplicationController < ActionController::Base
  #include PublicActivity::StoreController
  
  protect_from_forgery
  
  def auth_user
    unless user_signed_in? 
      redirect_to root_path, alert: "You need to sign in or sign up before continuing."
    end
  end
  
end
