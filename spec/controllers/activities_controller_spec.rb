require 'spec_helper'

describe ActivitiesController do

  describe "GET 'index'" do
    it "returns http success" do
      @user = create(:user)
      get 'index', id: @user.to_param
      response.should be_success
    end
  end

end
