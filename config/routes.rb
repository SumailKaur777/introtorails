Rails.application.routes.draw do
  root 'parks#index' # Set the root path to the parks index

  # Define a route for the about page
  get '/about', to: 'pages#about'

  resources :parks do
    resources :events
    resources :activities
    resources :facilities
  end

  # Add the search route
  get '/search', to: 'search#search', as: 'search'
end
