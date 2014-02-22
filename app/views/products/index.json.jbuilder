json.array!(@products) do |product|
  json.extract! product, :id, :name, :gtin
  json.url product_url(product, format: :json)
end
