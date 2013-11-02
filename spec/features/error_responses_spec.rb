require 'spec_helper'

describe "Error Responses" do
  before do
    password = 'password1'
    @current_user = create(:user, password: password, first_name: "Phillip", last_name: "Fry")
    visit new_user_session_path
    fill_in 'Email', with: @current_user.email
    fill_in 'Password', with: password
    first(:input, "[value='Sign in']").click
  end

  it "should show that the page does not exist" do
    visit "/gravel"
    assert page.has_content?('Phillip Fry')
    assert page.has_content?('Page Not Found')
  end

  it "should show that an HTTP method is not allowed" do
    page.driver.submit :put, invitations_path, {}
    assert page.has_content?('Phillip Fry')
    assert page.has_content?('Sorry, you are not allowed to do that.')
  end

  it "should show that the resource does not exist" do
    visit user_path(10000)
    assert page.has_content?('Phillip Fry')
    assert page.has_content?('Record Not Found')
  end

end
