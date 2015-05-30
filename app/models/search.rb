class Search < ActiveRecord::Base

def items
	@items ||= find_items
end

private

def find_items
	Item.find(:all, :conditions => conditions)
end

def name_conditions
	["items.name LIKE ?", "%#{name}#%"] unless name.blank?
end

def tag_conditions
	["items.all_tags LIKE ?", "%#{tag}#%"] unless tag.blank?
end

def user_email_conditions
	["items.user.email LIKE ?", "%#{user_email}#%"] unless user_email.blank?
end 

def category_conditions
	["items.category LIKE ?", "%#{category}#%"] unless category.blank?
end

def condition_conditions
	["items.condition LIKE ?", "%#{condition}#%"] unless condition.blank?
end

def minimum_price_conditions
  	["items.price >= ?", minimum_price] unless minimum_price.blank?
end

def maximum_price_conditions
 	 ["items.price <= ?", maximum_price] unless maximum_price.blank?
end

def conditions
  	[conditions_clauses.join(' AND '), *conditions_options]
end

def conditions_clauses
 	 conditions_parts.map { |condition| condition.first }
end

def conditions_options
 	 conditions_parts.map { |condition| condition[1..-1] }.flatten
end

def conditions_parts
 	 private_methods(false).grep(/_conditions$/).map { |m| send(m) }.compact
end

end
