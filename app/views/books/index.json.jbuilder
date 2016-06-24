json.array!(@books) do |book|
  json.extract! book, :id, :book_name, :price, :category
  json.url book_url(book, format: :json)
end