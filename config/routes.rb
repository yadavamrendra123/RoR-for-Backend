Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :restaurants
      post '/login', to: 'authentication#login'
      post '/signup', to: 'authentication#signup'
      post '/upload-profile-picture', to: 'profile_pictures#upload'
    end
  end
end
