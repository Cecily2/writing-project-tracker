class CreateUpdates < ActiveRecord::Migration[5.1]
  def change
    create_table :updates do |t|
      t.text :content
      t.datetime :date
      t.integer :words
      t.float :hours
      t.integer :project_id
      t.integer :user_id

      t.timestamps
    end
  end
end
