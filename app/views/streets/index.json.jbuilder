json.array!(@streets) do |street|
  json.extract! street, :id, :name
  json.url street_url(street, format: :json)
end
