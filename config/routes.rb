Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'movies/genres', to: 'movies#genres'
      resources :movies
    end
  end

  root 'api/v1/movies#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
