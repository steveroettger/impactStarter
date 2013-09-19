class ProjectsController < ApplicationController
  before_filter :auth_user, only: [:new, :edit, :update, :destroy]

  def index
    @projects = params[:search] ? Project.filter(params[:search]) : Project.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @projects }
    end
  end

  def show
    @project = Project.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @project }
    end
  end

  def new
    @project = Project.new
    3.times { @project.objectives.build }
    3.times { @project.tags.build }

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @project }
    end
  end

  def create
    @project = current_user.projects.build(params[:project])
    
    respond_to do |format|
      if @project.save
        @project.create_activity :create, owner: current_user, recipient: @project
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render json: @project, status: :created, location: @project }
      else
        format.html { render action: "new" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @project = Project.find(params[:id])

    respond_to do |format|
      format.html # edit.html.erb
      format.json { render json: @project }
    end
  end

  def update
    @project = Project.find(params[:id])

    respond_to do |format|
      if @project.update_attributes(params[:project])
        @project.create_activity :create, owner: current_user, recipient: @project
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @project = Project.find(params[:id]).destroy

    respond_to do |format|
      @project.create_activity :create, owner: current_user, recipient: @project
      format.html { redirect_to projects_url }
      format.json { head :ok }
    end
  end
end
