class Search < ActiveRecord::Base

def items
	@items ||= find_items
end

private

def find_items
    items =Item.order(:name)
    items =items.where("name ilike ?", "%#{name}%") if name.present?
    items =items.where("category ilike ?", "%#{category}%") if category.present?
    #items =items.where("tag ilike ?", "%#{tag}%") if tag.present?
    items =items.where("condition ilike ?", "%#{condition}%") if condition.present?
    items =items.where("price >= ?", minimum_price) if minimum_price.present?
    items =items.where("price <= ?", maximum_price) if maximum_price.present?
    items
end

end
