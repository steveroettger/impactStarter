ActiveAdmin.register AdminUser do
  
  # MAIN MENU PRIORITY
  menu priority: 2
  
  # FILTERS FOR QUERYING
  filter :email
  
  # ADMIN USER INDEX PAGE
  index do
    column :email do |admin_user|
      link_to admin_user.email, admin_user_path(admin_user)
    end 
    column :current_sign_in_at
    column :last_sign_in_at
    column :sign_in_count
    
    default_actions
  end
  
  # ADMIN USER FORM
  form do |f|
     f.inputs "Admin Details" do
       f.input :email
     end
     f.buttons
   end
end
