class AddUsernameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :username, :string
    add_index :users, :username, unique: true
    #Added for Profile Info
    add_column :users, :pid, :string
    add_column :users, :date_of_birth, :datetime
    add_column :users, :is_female, :boolean, default:false
  end
end
