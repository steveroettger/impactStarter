ActiveAdmin.register Project do

  # MAIN MENU PRIORITY
  menu priority: 5
  
  # FILTERS FOR QUERYING
  filter :id
  filter :title
  filter :organization
  filter :status, as: :select, collection: ['Pending', 'Published']
  
  # PROJECTS INDEX PAGE
  index do
    column :title do
      link_to project.title, admin_project_path(project)
    end
    column :description
    
    default_actions
  end
  
  # PROJECTS NEW/EDIT FORM
  form do |f|
    f.inputs "Create Projects" do
      f.input :title
      f.input :organization
      f.input :description
      f.input :image
      f.input :video_url
      f.input :status, as: :select, collection: ['Pending', 'Published']
    end
  end
end
