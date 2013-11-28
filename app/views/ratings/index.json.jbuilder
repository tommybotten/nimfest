json.array!(@ratings) do |rating|
  json.extract! rating, :name, :description, :jumper
  json.url rating_url(rating, format: :json)
end
