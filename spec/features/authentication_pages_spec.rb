require 'spec_helper'

describe "Authentication" do
  subject { page }
  
  describe "signin page" do
    before { visit new_user_session_path }
    
    it "should have the correct title" do
      page.should have_title(full_title('Sign In'))
    end
    
    it "allows a user to sign in if they have an account" do
      user = User.create(email: "person@example.com", password: "password")
      
      fill_in "Email",    with: "person@example.com"
      fill_in "Password", with: "password"
      
      click_button "Sign in"
      
      page.should have_content("Signed in successfully.")
    end
  end
  

end