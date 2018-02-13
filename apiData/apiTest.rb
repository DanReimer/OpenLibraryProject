require 'json'
require 'net/http'
require 'pp'

file = File.read('new_york_times_bestseller.json')

data_hash = JSON.parse(file)

new_file = File.new("openlibrary_data.json", "w")

project_data = []

data_hash['works'].take(5).each_with_index do |work, i|

	if (work.key?('cover_edition_key'))
		response = Net::HTTP.get_response(URI("https://openlibrary.org/api/books?bibkeys=#{work['cover_edition_key']}&format=JSON&jscmd=data"))
		api_result = JSON.parse(response.body)
		
		new_hash = {}
		new_hash['title'] = work['title']
		new_hash['authors'] = work['authors']
		new_hash['number_of_pages'] = api_result.values[0]['number_of_pages']
		new_hash['publish_date'] = api_result.values[0]['publish_date']
		new_hash['cover_links'] = api_result.values[0]['cover']
		new_hash['identifiers'] = api_result.values[0]['identifiers']
		new_hash['by_statement'] = api_result.values[0]['by_statement']
		
		# new_file.write(new_hash.to_s)
		project_data << new_hash
		puts "processed item #{i+1} of #{data_hash['works'].size}"
		sleep(3)
	end
end

new_file.write(JSON.generate(project_data))