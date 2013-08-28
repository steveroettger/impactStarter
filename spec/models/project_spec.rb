require 'spec_helper'

describe Project do

  describe "filter" do

    before do
      @project = create :project, title: "little boy blue", description: "Ran away with the spoon"
      @project2 = create :project, title: "the itsy bitsy spider", description: "cut off their tails with a carving knife"
    end

    it "should filter by a word in title" do
      projects = Project.filter("blue")
      expect(projects.count).to eq(1)
      expect(projects.first).to eq(@project)
    end

    it "should filter by a word in description" do
      projects = Project.filter("carving")
      expect(projects.count).to eq(1)
      expect(projects.first).to eq(@project2)
    end

    it "should filter by the beginning of a word" do
      projects = Project.filter("spo")
      expect(projects.count).to eq(1)
      expect(projects.first).to eq(@project)
    end

    it "should find nothing with nothing" do
      projects = Project.filter("")
      expect(projects.count).to eq(0)
      expect(projects).to eq([])

      projects = Project.filter(nil)
      expect(projects.count).to eq(0)
      expect(projects).to eq([])

      projects = Project.filter()
      expect(projects.count).to eq(0)
      expect(projects).to eq([])
    end

    it "should not filter by the end of a word" do
      projects = Project.filter("oon")
      expect(projects.count).to eq(0)
      expect(projects).to eq([])
    end

    it "should be inclusive" do
      projects = Project.filter("blue carving")
      expect(projects.count).to eq(2)
      expect(projects).to include(@project)
      expect(projects).to include(@project2)
    end
  end
end
