require 'spec_helper'

describe Project do

  describe "search" do

    before do
      @project = create :project, title: "little boy blue", description: "Ran away with the spoon"
      @project2 = create :project, title: "the itsy bitsy spider", description: "cut off their tails with a carving knife"
    end

    it "should search by a word in title" do
      projects = Project.search("blue")
      expect(projects.count).to eq(1)
      expect(projects.first).to eq(@project)
    end

    it "should search by a word in description" do
      projects = Project.search("carving")
      expect(projects.count).to eq(1)
      expect(projects.first).to eq(@project2)
    end

    it "should search by the beginning of a word" do
      projects = Project.search("spo")
      expect(projects.count).to eq(1)
      expect(projects.first).to eq(@project)
    end

    it "should find nothing with nothing" do
      projects = Project.search("")
      expect(projects.count).to eq(0)
      expect(projects).to eq([])

      projects = Project.search(nil)
      expect(projects.count).to eq(0)
      expect(projects).to eq([])

      projects = Project.search()
      expect(projects.count).to eq(0)
      expect(projects).to eq([])
    end

    it "should not search by the end of a word" do
      projects = Project.search("oon")
      expect(projects.count).to eq(0)
      expect(projects).to eq([])
    end

    it "should be inclusive" do
      projects = Project.search("blue carving")
      expect(projects.count).to eq(2)
      expect(projects).to include(@project)
      expect(projects).to include(@project2)
    end
  end
end
