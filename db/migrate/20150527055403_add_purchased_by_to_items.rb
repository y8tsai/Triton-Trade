class AddPurchasedByToItems < ActiveRecord::Migration
  def change
      add_column :items, :buyeremail, :string, null: false, default: "" 
  end
end
