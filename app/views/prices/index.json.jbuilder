json.array!(@prices) do |price|
  json.extract! price, :height, :price
  json.url price_url(price, format: :json)
end
