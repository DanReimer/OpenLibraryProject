json.extract! book, :id, :publishDate, :numberOfPages, :byStatement, :created_at, :updated_at
json.url book_url(book, format: :json)
