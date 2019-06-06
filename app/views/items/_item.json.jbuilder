json.extract! item, :id, :name, :image, :description, :grams, :doges, :created_at, :updated_at
json.url item_url(item, format: :json)
