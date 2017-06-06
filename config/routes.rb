Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :sessions, only: [:create, :destroy]
      resources :contacts, only: :create
      resources :popular_articles, only: :index
      resources :articles do
        resources :comments
        resources :favorites
      end
      resources :users do
        resources :relationships, only: [:create, :destroy]
        resources :articles, only: :index, controller: 'users/articles'
      end
      resources :categories do
        resources :articles, only: :index, controller: 'categories/articles'
      end
      resources :tags do
        resources :articles, only: :index, controller: 'tags/articles'
      end
    end
  end
end
