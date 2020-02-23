Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  root 'welcome#index'
  # get 'signup' => 'users#new'
  # post 'signup' => 'users#create'
  # get 'login' => 'sessions#new'
  # post 'login' => 'sessions#create'
  # post 'logout' => 'sessions#destroy'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
    # delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  end

  resources :users, only: [:index, :show]
  get "/search" => "users#index"
  match '/search', to: 'users#index', via: 'post'

  get "coffee/search" => "coffeees#index"
  match 'coffee/search', to: 'coffeees#index', via: 'post'
  # match 'users/search/:by_roast'
  # get 'users/:by_category', to: 'users#index'
  # get 'users/:by_roast', to: 'users#index'
  
  resources :coffeees, path: 'coffee' do 
    resources :reviews
  end

  resources :brands
    

end
