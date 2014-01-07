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
      
  match '/supervisor/admin',  :to => 'admins#admin'
  match '/supervisor/login',  :to => 'admins#login'
  match '/supervisor/logout',  :to => 'admins#logout'
  match '/supervisor/admin/new',  :to => 'admins#new'
  match '/supervisor/admin/edit',  :to => 'admins#edit'
  
  match '/result',  :to => 'users#result'
  
  match '/newpost', :to => 'posts#new'
  match '/chairs/pzs', :to => 'pages#pzs'
  
  # зверху хуйня

  resources :sessions
  resources :admins
  get    '/login'  => 'sessions#new',     as: 'login'
  delete '/logout' => 'sessions#destroy', as: 'logout'
end
