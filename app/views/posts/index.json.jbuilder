json.array!(@posts) do |post|
  json.extract! post, :id, :description, :title
  json.url post_url(post, format: :json)
end
