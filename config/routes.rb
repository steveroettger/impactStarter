ImpactStarter::Application.routes.draw do

  get "activities/index"

  root to: 'site#home'
  match '/about',     to: 'site#about'
  match '/faqs',      to: 'site#faq'
  match '/terms',     to: 'site#terms'
  match '/privacy',   to: 'site#privacy'

  # ADMIN ROUTES
  ActiveAdmin.routes(self)
  devise_for :admin_users, ActiveAdmin::Devise.config

  # USER ROUTES
  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks"}
  resources  :users do
    member do
     get :following, :followers
    end
  end

  # PROJECTS ROUTES
  resources :projects

  # ORGANIZATIONS ROUTES
  resources :organizations

  # RELATIONSHIPS
  resources :relationships, only: [:create, :destroy]

  # PUBLIC ACTIVITY
  resources :activities

  resources :invitations, only: [:index, :new, :create, :show]

  # Catch-all to allow proper HTTP responses for 405 and 501
  match "*route_not_found.:format", :to => "application#route_not_found"
  match "*route_not_found",         :to => "application#route_not_found"
end
