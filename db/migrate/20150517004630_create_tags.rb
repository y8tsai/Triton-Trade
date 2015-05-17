class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :title 
      
      t.timestamps
    end

    create_table :tags_items, id: false do |t|
      t.belongs_to :tag, index: true
      t.belongs_to :item, index: true
    end
  end
end
