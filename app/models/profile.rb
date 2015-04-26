class Profile < ActiveRecord::Base
   validates :profile, :presence => true
end
