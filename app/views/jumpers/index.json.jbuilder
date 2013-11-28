json.array!(@jumpers) do |jumper|
  json.extract! jumper, :name, :license, :rating, :description, :club, :phone, :email, :verified, :nextofkin, :license
  json.url jumper_url(jumper, format: :json)
end
