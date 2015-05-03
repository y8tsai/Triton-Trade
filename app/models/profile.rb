class Profile < ActiveRecord::Base
  belongs_to :user
  validates :profile, :presence => true
end
