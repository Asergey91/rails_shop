json.array!(@references) do |reference|
  json.extract! reference, :id, :integer, :string, :text
  json.url reference_url(reference, format: :json)
end
