json.array!(@contents) do |content|
  json.extract! content, :id, :link, :title
  json.url content_url(content, format: :json)
end
