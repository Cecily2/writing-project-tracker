class AddDetailsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :about, :text
    add_column :users, :picture, :string
    add_column :users, :gender, :string
    add_column :users, :username, :string
  end
end
