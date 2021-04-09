class Movies::Admin::MoviesController < ApplicationController
  def load_all_movies
    movies = Movie.order('created_at DESC')
    render(
      json: {
        status: 'SUCCESS', message: 'Filmes carregados', data: movies
      },
      status: :ok
    )
  end

  def create_movie
    movie = Movie.build_movie(
      title: params[:title],
      year: params[:year],
      genre: params[:genre],
      director: params[:director]
    )

    movie.save!

    render(json: { data: movie }, status: :ok)
  end

  def delete_movie
    movie_id = params[:movie_id]

    # movie = Movie.find_by(id: movie_id)
    # movie.destroy

    Movie.find_by(id: movie_id).destroy
  end

  def update_movie
    movie_id = params[:movie_id]
    # title = params[:title]

    movie = Movie.find_by(id: movie_id)
    movie.update(
      title: params[:title] || movie.title,
      year: params[:year] || movie.year
    )

    render(json: { data: movie }, status: :ok)
  end
end
