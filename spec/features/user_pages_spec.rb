require 'spec_helper'

describe "User pages" do
  subject { page }
  
  describe "signup page" do
    before { visit new_user_registration_path }
    
    it "should have the correct title" do
      page.should have_title(full_title('Create Account'))
    end
  end
  

end