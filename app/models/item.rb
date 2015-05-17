class Item < ActiveRecord::Base
  has_many :taggings
  has_many :tags, through: :taggings
  belongs_to :user
  validates :user_id, presence: true
  validates :name, presence: true
 
end
