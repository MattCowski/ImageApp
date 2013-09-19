json.array!(@paintings) do |painting|
  json.extract! painting, :name
  json.url painting_url(painting, format: :json)
end
