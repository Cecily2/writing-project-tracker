class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.integer :word_goal
      t.integer :words, default: 0
      t.float :hours, default: 0
      t.integer :user_id

      t.timestamps
    end
  end
end
