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
      get 'load_favorites_list', to: 'movies#load_favorites_list'
      get 'load_favorite_movies_by_year/:year', to: 'movies#load_favorite_movies_by_year'

      post 'add_movie_to_favorites_list', to: 'movies#add_movie_to_favorites_list'
      delete 'remove_movie_to_favorites_list', to: 'movies#remove_movie_to_favorites_list'
    end
  end
end
