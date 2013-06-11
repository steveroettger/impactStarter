require 'spec_helper'

describe "Project pages" do
  subject { page }
  
  describe "projects new page" do
    before { visit new_projects_path }
    
  end
  
  describe "projects index page" do
    before { visit projects_path }
    
  end
  
  describe "projects show page" do
    before { visit projects_path(project) }
    
  end
  
  describe "project destruction" do
    before { visit new_projects_path }
    
  end

end