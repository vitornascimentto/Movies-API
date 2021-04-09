class Movies::User::MoviesController < ApplicationController
  def find_movie_by_title
    title = params[:title]

    movie = Movie.find_by(title: title)

    unless movie
      render(
        json: { error: { message: 'Movie not found' } },
        status: :not_found
      )
    end

    render(json: { data: movie }, status: :ok)
  end
end
