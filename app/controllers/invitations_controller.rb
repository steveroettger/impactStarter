class InvitationsController < ApplicationController
  before_filter :auth_user

  def index
    @connections = Connection.convert current_user, linkedin_client.connections.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @connections }
    end
  end

  def new
    @invitation = current_user.invitations.build params[:invitation]
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @connections }
    end
  end

  def create
    @invitation = current_user.invitations.build params[:invitation]
    respond_to do |format|
      if @invitation.save
        format.html { redirect_to invitations_path, notice: 'Invitation was successfully created.' }
        format.json { render json: @invitation, status: :created, location: @invitation }
      else
        format.html { render action: "new" }
        format.json { render json: @invitation.errors, status: :unprocessable_entity }
      end
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
