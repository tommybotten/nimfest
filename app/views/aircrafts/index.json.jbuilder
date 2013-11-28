json.array!(@aircrafts) do |aircraft|
  json.extract! aircraft, :type, :name, :price, :capacity
  json.url aircraft_url(aircraft, format: :json)
end
