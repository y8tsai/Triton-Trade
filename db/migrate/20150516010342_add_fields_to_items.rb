class AddFieldsToItems < ActiveRecord::Migration
  def change
    add_column :items, :is_sold, :boolean, default: false
    add_column :items, :price, :decimal, precision: 6, scale: 2
    add_column :items, :image_url, :string
    add_column :items, :condition, :string
  end
end
