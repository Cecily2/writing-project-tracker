class CreateProgressUpdates < ActiveRecord::Migration[5.1]
  def change
    create_table :progress_updates do |t|
      t.text :content
      t.integer :words
      t.float :hours
      t.integer :project_id
      t.integer :user_id

      t.timestamps
    end
  end
end
