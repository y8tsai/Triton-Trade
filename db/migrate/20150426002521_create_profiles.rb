class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :profile
      t.timestamps
    end
  end

  def self.down
      drop_table :profiles
  end
end
