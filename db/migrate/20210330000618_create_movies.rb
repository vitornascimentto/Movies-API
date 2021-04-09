class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :year
      t.string :run_time
      t.string :genre
      t.string :director

      t.timestamps
    end
  end
end
