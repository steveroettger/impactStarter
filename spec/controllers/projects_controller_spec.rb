require 'spec_helper'

describe ProjectsController do
  
   let(:project) { FactoryGirl.create(:project) }
  
  describe "GET #index" do
    it "populates an array of projects" do
      project = create(:project)
      get :index
      #assigns(:projects).should eq([project])
    end
    
    it "renders the index template" do
      get :index
      response.should render_template :index
    end
  end
  
  describe "GET #show" do
    it "assigns the requested project to @project" do
      project = create(:project)
      get :show, id: project
      assigns(:project).should eq(project)
    end
    
    it "renders the show template" do
      get :show, id: project
      response.should render_template :show
    end
  end
  
  describe "GET #new" do
    it "assigns a new Project to @project" do
      get :new
      
    end
    
    it "renders the new template" do
      get :new
      response.should render_template :new
    end
  end
  
  describe "POST #create" do
    context "with valid attributes" do
      it "saves the new project in the database" do
        expect {
          post :create, project: FactoryGirl.attributes_for(:project)
        }.to change(Project, :count).by(1)
      end
      
      it "redirects to the home page" do
        post :create, project: FactoryGirl.attributes_for(:project)
        response.should redirect_to Project.last
      end
    end
    
    context "with invalid attributes" do
      it "does not save the new project in the database" do
        expect {
          post :create, project: FactoryGirl.build(:project, title: "", description: "")
        }.to_not change(Project, :count)
      end
      
      it "re-renders the new template" do
        post :create, project: FactoryGirl.build(:project, title: "", description: "")
        response.should render_template :new
      end
    end
  end
end