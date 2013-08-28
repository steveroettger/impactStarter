require 'spec_helper'

describe User do
  describe "filter" do
    before do
      @user = create :user, first_name: "Phillip", last_name: "Fry", headline: "little boy blue", bio: "Ran away with the spoon"
      @user2 = create :user, first_name: "Turanga", last_name: "Leela", headline: "the itsy bitsy spider", bio: "cut off their tails with a carving knife"
    end

    it "should filter by a word in first_name" do
      users = User.filter("phillip")
      expect(users.count).to eq(1)
      expect(users.first).to eq(@user)
    end

    it "should filter by a word in last_name" do
      users = User.filter("leela")
      expect(users.count).to eq(1)
      expect(users.first).to eq(@user2)
    end

    it "should filter by a word in headline" do
      users = User.filter("blue")
      expect(users.count).to eq(1)
      expect(users.first).to eq(@user)
    end

    it "should filter by a word in bio" do
      users = User.filter("carving")
      expect(users.count).to eq(1)
      expect(users.first).to eq(@user2)
    end

    it "should filter by the beginning of a word" do
      users = User.filter("spo")
      expect(users.count).to eq(1)
      expect(users.first).to eq(@user)
    end

    it "should find nothing with nothing" do
      users = User.filter("")
      expect(users.count).to eq(0)
      expect(users).to eq([])

      users = User.filter(nil)
      expect(users.count).to eq(0)
      expect(users).to eq([])

      users = User.filter()
      expect(users.count).to eq(0)
      expect(users).to eq([])
    end

    it "should not filter by the end of a word" do
      users = User.filter("oon")
      expect(users.count).to eq(0)
      expect(users).to eq([])
    end

    it "should be inclusive" do
      users = User.filter("blue carving")
      expect(users.count).to eq(2)
      expect(users).to include(@user)
      expect(users).to include(@user2)
    end
  end
end
