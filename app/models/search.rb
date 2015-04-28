class Search < ActiveRecord::Base
    validates :search, :presence => true
end
