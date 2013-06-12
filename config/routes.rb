ImpactStarter::Application.routes.draw do
  
  root to: 'site#home'
  match '/about',     to: 'site#about'
  match '/faqs',      to: 'site#faq'    
  match '/terms',     to: 'site#terms'
  match '/privacy',   to: 'site#privacy'
  
  # ADMIN ROUTES 
  ActiveAdmin.routes(self)
  devise_for :admin_users, ActiveAdmin::Devise.config

  #USER ROUTES
  devise_for :users
  resources  :users

  #PROJECTS ROUTES
  resources :projects
    
end
