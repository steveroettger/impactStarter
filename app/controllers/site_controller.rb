class SiteController < ApplicationController

  before_filter :accept_stored_invitation, only: :home

  def home
    #@project = Project.featured.first
    @projects = Project.all
  end

  def about

  end

  def terms

  end

  def privacy

  end

  private

    def accept_stored_invitation
      if session['registration.invitation_id'].present? and
           current_user and
             invitation = Invitation.unaccepted.where(id: session['registration.invitation_id']).first
         invitation.accept(current_user)
      end
    end
end
