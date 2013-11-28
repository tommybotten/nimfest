json.array!(@loads) do |load|
  json.extract! load, :pilot, :flighttime, :references
  json.url load_url(load, format: :json)
end
