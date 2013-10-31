require 'spec_helper'

describe Invitation do
  before do
    @invitation = build :invitation, message: nil
  end

  describe "message" do
    it "should require signup link" do
      expect(@invitation.valid?).to eq(false)
      expect(@invitation.errors[:message]).to include("must contain {{signup}} link")
    end

    it "should handle bad syntax on validation" do
      @invitation.message = "this is the {{signup} link"
      expect(@invitation.valid?).to eq(false)
      expect(@invitation.errors[:message]).to include("must contain {{signup}} link")
    end
  end

  describe "message_with_url" do
    it "should replace signup tag" do
      @invitation.message = "this is the {{signup}} link"
      expect(@invitation.message_with_url("REPLACED")).to eq("this is the REPLACED link")
    end

    it "should return nothing on syntax error" do
      @invitation.message = "this is the {{signup} link"
      expect(@invitation.message_with_url("REPLACED")).to be_blank
      expect(@invitation.message_with_url("REPLACED")).to be_nil
    end

    it "should remove other tags" do
      @invitation.message = "this is the {{other}} link"
      expect(@invitation.message_with_url("REPLACED")).to eq("this is the  link")
      @invitation.message = "this is the {% for x in ys %}{{x.method}}{% endfor%} link"
      expect(@invitation.message_with_url("REPLACED")).to eq("this is the  link")
    end
  end
end
