require "error_response_actions"

class ApplicationController < ActionController::Base

  protect_from_forgery

  include ErrorResponseActions
  # rescue_from CanCan::AccessDenied, :with => :authorization_error
  rescue_from ActiveRecord::RecordNotFound, :with => :resource_not_found

  private

  def authenticate!
    current_user || devise_controller? || ( authentication_error and return false )
  end
end
