require 'spec_helper'

describe "User pages" do
  subject { page }
  
  describe "signup page" do
    before { visit new_user_registration_path }
    
    it "should have the correct title" do
      page.should have_title(full_title('Create Account'))
    end
    
    it "should allow new users to create an account" do
      #fill_in "First Name",              with: "Some"
      #fill_in "Last Name",               with: "Person"
      fill_in "Email",                   with: "person@example.com"
      fill_in "Password",                with: "password"
      fill_in "Password confirmation",   with: "password"
      
      click_button "Sign up"
      
      page.should have_content("Welcome! You have signed up successfully.")
    end
  end
  

end