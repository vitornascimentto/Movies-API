class Movies::User::MoviesController < ApplicationController
  def find_movie_by_title
    title = params[:title]

    # movie = Movie.find_by(title: title)
    movie = Movie.select(:id, :title).find_by(title: title)

    unless movie
      render(
        json: { error: { message: 'Movie not found' } },
        status: :not_found
      )
    end

    render(json: { data: movie }, status: :ok)
  end

  def add_movie_to_favorites_list
    movie = load_movie
    favorite_movie = FavoriteMovie.find_by(movie: movie)
    # render(json: { data: { message: 'message' } }) if favorite_movie.present?
    if favorite_movie.present?
      render(json: { data: { message: 'message' } })
      return
    end

    fav_movie = FavoriteMovie.create!(movie: movie, description: 'haha')
    render(json: { data: fav_movie }, status: :ok)
  end

  def remove_movie_to_favorites_list
    movie = load_movie

    favorite_movie = FavoriteMovie.find_by(movie: movie)

    if favorite_movie.blank?
      render(json: { data: { message: 'error' } })
      return
    end

    favorite_movie.destroy
    render(json: { data: { message: 'success' } })
  end

  def load_favorites_list
    favorite_movies = FavoriteMovie.order('created_at DESC')
    render(json: { data: favorite_movies }, status: :ok)
  end

  def load_favorite_movies_by_year
    year = params[:year]

    favorite_movies = FavoriteMovie.joins(:movie).where(movies: { year: year })
    # favorite_movies = FavoriteMovie.includes(:movie).where(movies: { year: year })
    render(json: { data: favorite_movies }, status: :ok)
  end

  private

  def load_movie
    movie_id = params[:movie_id]

    movie = Movie.find_by(id: movie_id)

    unless movie
      render(
        json: { error: { message: 'Movie not found' } },
        status: :not_found
      )
    end

    movie
  end
end
