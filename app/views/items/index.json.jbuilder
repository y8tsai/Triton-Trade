json.array!(@items) do |item|
  json.extract! item, :id, :name, :condition, :price, :user_id
  json.url item_url(item, format: :json)
end
