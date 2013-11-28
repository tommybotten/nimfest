json.array!(@slots) do |slot|
  json.extract! slot, :height, :price, :paid, :approved, :jumptype, :jumpmaster
  json.url slot_url(slot, format: :json)
end
