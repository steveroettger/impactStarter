ActiveAdmin.register Organization do

  # MAIN MENU PRIORITY
  menu priority: 4
 
  # FILTERS FOR QUERYING
  filter :id
  filter :name
  filter :city
  filter :state
  filter :entity_type, as: :select, collection: ['Sole Proprietorship', 'LLP', 'LLC', 'S Corporation', 'C Corporation']
  filter :tax_status, as: :select, collection: ['Non Profit', 'For Profit']
  filter :status, as: :select, collection: ['Pending', 'Published']
  
  # ORGANIZATION INDEX PAGE
  index do
    column :id
    column :name do |organization|
      link_to organization.name, admin_user_path(admin_user)
    end 
    
    default_actions
  end
  
  # ORGANIZATION NEW/EDIT FORM
  form do |f|
    f.inputs "Create an Organization" do
      f.input :name
      f.input :address
      f.input :city
      f.input :state
      f.input :entity_type, as: :select, collection: ['Sole Proprietorship', 'LLP', 'LLC', 'S Corporation', 'C Corporation']
      f.input :tax_status, as: :select, collection: ['Non Profit', 'For Profit']
      f.input :status, as: :select, collection: ['Pending', 'Published']
    end
  end
   
end
