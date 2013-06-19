ActiveAdmin::Dashboards.build do
    
  section "Recently Created Projects" do
    table_for Project.order("created_at desc").limit(5) do
      column :title
      column :status
      column :created_at
    end
    strong { link_to "View All Projects", admin_projects_path }  
  end
  
  

end
