# -*- encoding : utf-8 -*-
Fit::Application.routes.draw do

  root :to => 'pages#index'


  match '/admins/deanery_editor', :to =>'admins#deanery_editor'

  get "admins/static_pages_editor"
  
  match '/chairs',  :to => 'pages#chairs'
  match '/deanery_full_time',  :to => 'pages#deanery_full_time'
  match '/deanery_correspondence',  :to => 'pages#deanery_correspondence'
  match '/applicant',  :to => 'pages#applicant'
  match '/contact',  :to => 'pages#contact'
  match '/cabinet',  :to => 'pages#private_cabinet'
  match '/student/scientific_society', :to => 'pages#scientific_society'
      
  match '/supervisor/admin',  :to => 'admins#admin'
  match '/supervisor/login',  :to => 'admins#login'
  match '/supervisor/logout',  :to => 'admins#logout'
  match '/supervisor/admin/new',  :to => 'admins#new'
  match '/supervisor/admin/edit',  :to => 'admins#edit'
  match '/login',  :to => 'users#login'
 
  resources :posts, :except => [:index, :show]
 
  match "(posts/show/:id)"  => "pages#show"
  match "posts(/:page)"     => "pages#index"
  
  match '/result',  :to => 'users#result'
  
  match '/newpost', :to => 'posts#new'
  match '/chairs/pzs', :to => 'pages#pzs'

  match ':controller/:action'

  match '/newfile', :to => 'deanery_files#new'
  
  match '/student/scientific_society', :to => 'pages#scientific_society'
  match '/student/students_sg', :to => 'pages#students_sg'

  # зверху хуйня


  match ':controller/:action'

  match '/chairs/iust', :to => 'pages#iust'
  match '/chairs/zimm', :to => 'pages#zimm'

  match ':controller/:action'

  resources :sessions
  resources :admins
  get    '/login'  => 'sessions#new',     as: 'login'
  delete '/logout' => 'sessions#destroy', as: 'logout'

  # Devise & Omniauth
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  devise_scope :user do
    get '/users/auth/:provider' => 'users/omniauth_callbacks#passthru'
  end

end
