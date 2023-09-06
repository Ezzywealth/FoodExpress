Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :categories
      resources :subcategories
      resources :restaurants
      resources :menuitems
      resources :menuorders
      resources :restaurantorders
      resources :orders
      resources :customers
      resources :users, only: [:index, :show, :update, :destroy]
      resources :budgetlists, only: [:index, :show, :update, :destroy, :create]
    end
  end

  devise_for :users, path: 'api/v1', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
  controllers: {
    sessions: 'users/sessions', # Custom path for sessions controller
    registrations: 'users/registrations', # Custom path for registrations controller
    confirmations: 'users/confirmations', # Custom path for confirmations controller
    passwords: 'users/passwords' # Custom path for passwords controller
  }

end
