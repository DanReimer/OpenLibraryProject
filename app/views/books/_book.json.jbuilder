json.extract! book, :id, :title, :authors, :numberOfPages, :cover, :created_at, :updated_at
json.url book_url(book, format: :json)
