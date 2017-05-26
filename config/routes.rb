Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :articles do
        resources :comments
        resources :favorites
      end
      get "popular_articles" => "articles/article_helpers#popular_articles"
      resources :users do
        member do
          get "articles_by_user" => "articles/article_helpers#articles_by_user"
        end
      end
      resources :sessions
      resources :categories
      resources :contacts
    end
  end
end
