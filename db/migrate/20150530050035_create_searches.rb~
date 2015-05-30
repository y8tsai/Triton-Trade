class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.string :name
      t.string :category
      t.decimal :minimum_price
      t.decimal :maximum_price   
      t.string  :tag
      t.string  :condition
      t.timestamps
    end
  end
end
