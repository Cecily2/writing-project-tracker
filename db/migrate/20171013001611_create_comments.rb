class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.text :content
      t.datetime :date
      t.integer :user_id
      t.integer :progress_update_id

      t.timestamps
    end
  end
end
