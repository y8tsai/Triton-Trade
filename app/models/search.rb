class Search < ActiveRecord::Base

def items
	@items ||= find_items
end

private

def find_items
    items =Item.where("name like ?", "%#{name}#%") if name.present?
    items =Item.where("category like ?", "%#{category}#%") if category.present?
    #items =items.where("tag like ?", "%#{tag}#%") if tag.present?
    items =Item.where("condition like ?", "%#{condition}#%") if condition.present?
    items =Item.where("price >= ?", minimum_price) if minimum_price.present?
    items =Item.where("price <= ?", maximum_price) if maximum_price.present?
    items
end

end
