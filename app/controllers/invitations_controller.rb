class InvitationsController < ApplicationController
  before_filter :auth_user

  def index
    @connections = Connection.convert linkedin_client.connections.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @connections }
    end
  end

  def linkedin_client
    unless @linkedin_client
      @linkedin_client = LinkedIn::Client.new
      @linkedin_client.authorize_from_access session["linkedin.access"][:token],
                                             session["linkedin.access"][:secret]
    end
    @linkedin_client
  end

end
