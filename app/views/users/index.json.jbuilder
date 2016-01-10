json.array!(@users) do |user|
  json.extract! user, :id, :string
  json.url user_url(user, format: :json)
end
