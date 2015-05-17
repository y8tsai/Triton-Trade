class AddUserIdToItems < ActiveRecord::Migration
  def change
    add_column :items, :role, :string
  end
end
