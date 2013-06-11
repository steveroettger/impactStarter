require 'spec_helper'

describe "Authentication" do
  subject { page }
  
  describe "signin page" do
    before { visit new_user_session_path }
    
    it "should have the correct title" do
      page.should have_title(full_title('Sign In'))
    end
  end
  

end