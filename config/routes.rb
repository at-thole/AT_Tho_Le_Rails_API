Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users
      resources :sessions
      resources :categories
      resources :articles do
        get "popular_article" => "articles#popular_article"
        resources :comments
        resources :favorites
      end
      resources :contacts
    end
  end
end
