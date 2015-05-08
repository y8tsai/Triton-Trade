class AddUsernameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :username, :string
    add_index :users, :username, unique: true
  
    add_column :users, :PID, :string
    add_column :users, :date_of_birth, :datetime
    add_column :users, :is_female, :boolean, default:false
    add_column :users, :avatar_url, :string
  end
end
