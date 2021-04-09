Rails.application.routes.draw do
  namespace :movies do
    # resources :movies

    # get '/movies', to: 'movies#load_all_movies'

    scope module: :admin, path: 'admin' do
      get 'load_all_movies', to: 'movies#load_all_movies'
      post 'create_movie', to: 'movies#create_movie'
      delete 'delete_movie/:movie_id', to: 'movies#delete_movie'
      patch 'update_movie/:movie_id', to: 'movies#update_movie'
    end

    scope module: :user, path: 'user' do
      get 'find_movie_by_title/:title', to: 'movies#find_movie_by_title'
    end
  end
end
