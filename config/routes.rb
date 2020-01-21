Rails.application.routes.draw do
  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]

  resources :users, only: [:create, :show] do
    resource :password, controller: "clearance/passwords", only: [:edit, :update]
  end
  
  constraints Clearance::Constraints::SignedIn.new do
    root to: 'users#wall', as: :users_root
  end

  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :posts
  # resources :walls do
  #   member do
  #     get 'posts'
  #   end
  # end 

  # get 'walls', to: 'userss#show'

  # get 'walls(/:id)', to: 'walls#index'
end
