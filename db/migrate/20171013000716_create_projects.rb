class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.string :cover_art
      t.integer :word_goal
      t.integer :words, default: 0
      t.integer :time, default: 0
      t.integer :user_id

      t.timestamps
    end
  end
end
