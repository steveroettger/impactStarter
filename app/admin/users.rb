ActiveAdmin.register User do

  # MAIN MENU PRIORITY
  menu priority: 3
  
  # FILTERS FOR QUERYING
  filter :id
  filter :first_name
  filter :last_name
  filter :email
  
  # USER INDEX PAGE
  index do
    column :first_name
    column :last_name
    column :email 
    column :created_at

    default_actions
  end
  
end
