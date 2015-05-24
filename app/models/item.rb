class Item < ActiveRecord::Base
  has_many :taggings
  has_many :tags, through: :taggings
  belongs_to :user
  validates :user_id, presence: true
  validates :name, presence: true
  validates :price, :numericality => { :greater_than_or_equal_to => 0 }, presence: true
 
  def all_tags=(names)
    self.tags = names.split(",").map do |name|
      Tag.where(name: name.downcase.strip).first_or_create!
    end
  end
 
  def all_tags
    self.tags.map(&:name).join(", ")
  end

  def self.tagged_with(name)
    Tag.find_by_name!(name).items
  end

  
end
