Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :categories
      resources :subcategories
      resources :restaurants
      resources :menuitems
      resources :users, only: [:index, :show, :update, :destroy]
    end
  end

  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
  controllers: {
    sessions: 'users/sessions', # Custom path for sessions controller
    registrations: 'users/registrations' # Custom path for registrations controller
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
