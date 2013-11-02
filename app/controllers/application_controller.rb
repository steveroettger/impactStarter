require "error_response_actions"

class ApplicationController < ActionController::Base

  protect_from_forgery

  include ErrorResponseActions
  # rescue_from CanCan::AccessDenied, :with => :authorization_error
  rescue_from ActiveRecord::RecordNotFound, :with => :resource_not_found
  rescue_from LinkedIn::Errors::AccessDeniedError, :with => :linkedin_error

  private

  def authenticate!
    current_user || devise_controller? || ( authentication_error and return false )
  end

  def linkedin_error
    # 403 Forbidden - LinkedIn Error
    respond_to do |format|
      format.html{ render '/rescues/linkedin_error', :status => 403 }
      format.xml{  render :xml => 'LinkedIn Error',  :status => 403 }
      format.json{ render :json => 'LinkedIn Error', :status => 403 }
    end
  end
end
