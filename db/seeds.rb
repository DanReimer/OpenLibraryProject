# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'

Identifier.destroy_all
Cover.destroy_all
Author.destroy_all
Book.destroy_all

file = File.read('apiData/openlibrary_data.json')
openlibrary_data = JSON.parse(file)

openlibrary_data.each do |item|
  new_book = Book.create!(title: item['title'],
                          publishDate: item['publish_date'],
                          numberOfPages: item['number_of_pages'],
                          byStatement: item['by_statement'])

  item['authors'].each do |a|
    author = Author.find_or_create_by!(name: a['name'])
    new_book.authors << author
  end

  item['identifiers'].each do |ids|
    new_book.identifiers.create!(idType: ids[0],
                                 number: ids[1][0])
  end

  cover_links = item['cover_links']
  new_book.create_cover(smallLink: cover_links['small'],
                        mediumLink: cover_links['medium'],
                        largeLink: cover_links['large'])

  new_book.save!
end
