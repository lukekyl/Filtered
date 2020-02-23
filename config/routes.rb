Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  root 'welcome#index'

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

  
  resources :coffeees, path: 'coffee' do 
    resources :reviews
  end

  resources :brands

end
