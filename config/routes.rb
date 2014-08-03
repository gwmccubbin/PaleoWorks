PaleoWorks::Application.routes.draw do
  root 'dashboard#show'
  
  devise_for :users, :skip => [:sessions]

  as :user do
    get 'signin' => 'devise/sessions#new', :as => :new_user_session
    post 'signin' => 'devise/sessions#create', :as => :user_session
    get 'signout' => 'devise/sessions#destroy', :as => :destroy_user_session
  end

  resources :customers 
  resources :items
  resources :locations
  resources :menus
  resources :orders do
    resources :order_items
  end
end
