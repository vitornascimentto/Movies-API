class Movie < ApplicationRecord
  GENRE_OPTIONS = %w[superhero adventure action horror animation].freeze

  validates :title, presence: true
  validates :genre, inclusion: {
    in: GENRE_OPTIONS,
    message: '%{value} is not a valid genre'
  }

  def self.build_movie(title:, year: nil, genre:, director: nil)
    Movie.new(title: title, year: year, genre: genre, director: director)
  end
end

# ruby version ≥ 2.3
# rails version ≥ 5
# PostgreSQL

# rails new movies --api

# Código da base de dados

# gem 'pg', '~> 0.21.0'
# bundle install

# rails g model Movie title:string
# generate migration CreateMovie
# rails db:migrate

# gem 'faker'
# bundle install

# rails db:seed

# rails routes


# links

# https://guides.rubyonrails.org/active_record_migrations.html