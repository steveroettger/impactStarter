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
          post :create, project: FactoryGirl.create(:project, title: "", description: "")
        }.to_not change(Project, :count)
      end
      
      it "re-renders the new template" do
        post :create, project: FactoryGirl.create(:project, title: "", description: "")
        response.should render_template :new
      end
    end
  end
  
  describe "PUT update" do
    before :each do
      @project = FactoryGirl.create(:project, title: "Example Project", description: "This is a test...")
    end
    
    context "with valid attributes" do
      it "should locate the requested @project" do
        put :update, id: @project, project: FactoryGirl.attributes_for(:project)
        assigns(:project).should eq(@project)
      end
      
      it "should update @project's attributes" do
        put :update, id: @project, project: FactoryGirl.attributes_for(:project, title: "Test Project", description: "This is not a test...")
        @project.reload
        @project.title.should eq("Test Project")
        @project.description.should eq("This is not a test...")
      end
      
      it "redirects to the updated project" do
        put :update, id: @project, project: FactoryGirl.attributes_for
      end
    end
  end
  
  describe "DELETE destroy" do
    before :each do
      @project = create(:project)
    end
    
    it "should delete the project" do
      expect {
        delete :destroy, id: @project
      }.to change(Project, :count).by(-1)
    end
    
    it "redirects to projects#index" do
      delete :destroy, id: @project
      response.should redirect_to projects_url
    end
  end
end