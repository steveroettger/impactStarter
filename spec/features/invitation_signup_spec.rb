require 'spec_helper'

describe "Invitation Signup" do
  describe "with an invitation link" do
    before do
      @invitation = create :invitation
    end

    it "should record the user's info" do
      when_i_visit_an_active_invitation
      then_i_should_be_on_the_signup_page
      when_i_complete_the_signup_form
      then_the_invitation_should_be_accepted
    end

    def when_i_visit_an_active_invitation
      visit invitation_path(@invitation)
    end

    def when_i_complete_the_signup_form
      fill_in "Email",                   with: "person@example.com"
      fill_in "Password",                with: "password1"
      fill_in "Password confirmation",   with: "password1"
      click_button "Sign up"
    end

    def then_i_should_be_on_the_signup_page
      page.should have_content("Create An Account")
    end

    def then_the_invitation_should_be_accepted
      @invitation.reload
      expect(@invitation.accepted_at).to be_present
      expect(@invitation.invitee).to be_present
    end
  end
end
