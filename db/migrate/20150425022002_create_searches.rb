class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.string :search, :null => false
      t.timestamps
    end
  end

   def self.down
      drop_table :searches
   end
end
