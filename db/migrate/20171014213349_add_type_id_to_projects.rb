class AddTypeIdToProjects < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :type_id, :integer
  end
end
