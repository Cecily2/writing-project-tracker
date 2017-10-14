class CreateProjectGenres < ActiveRecord::Migration[5.1]
  def change
    create_table :project_genres do |t|
      t.integer :genre_id
      t.integer :project_id

      t.timestamps
    end
  end
end
