class CreateFavoriteMovie < ActiveRecord::Migration[6.0]
  def change
    create_table :favorite_movies do |t|
      t.string :description
      t.references :movie, null: false, foreign_key: true

      t.timestamps
    end
  end
end
