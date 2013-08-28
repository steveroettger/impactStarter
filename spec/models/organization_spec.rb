require 'spec_helper'

describe Organization do
  describe "filter" do
    before do
      @organization = create :organization, name: "Planet Express"
      @organization2 = create :organization, name: "Mom's Friendly Robot Company"
          end

    it "should filter by a word in title" do
      organizations = Organization.filter("planet")
      expect(organizations.count).to eq(1)
      expect(organizations.first).to eq(@organization)
    end

    it "should filter by the beginning of a word" do
      organizations = Organization.filter("robo")
      expect(organizations.count).to eq(1)
      expect(organizations.first).to eq(@organization2)
    end

    it "should find nothing with nothing" do
      organizations = Organization.filter("")
      expect(organizations.count).to eq(0)
      expect(organizations).to eq([])

      organizations = Organization.filter(nil)
      expect(organizations.count).to eq(0)
      expect(organizations).to eq([])

      organizations = Organization.filter()
      expect(organizations.count).to eq(0)
      expect(organizations).to eq([])
    end

    it "should not filter by the end of a word" do
      organizations = Organization.filter("press")
      expect(organizations.count).to eq(0)
      expect(organizations).to eq([])
    end

    it "should be inclusive" do
      organizations = Organization.filter("planet robot")
      expect(organizations.count).to eq(2)
      expect(organizations).to include(@organization)
      expect(organizations).to include(@organization2)
    end
  end
end
