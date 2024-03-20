require 'json'
require 'open-uri'
require 'faker'

# Pull data from Winnipeg Open Data API
url = 'https://data.winnipeg.ca/resource/tx3d-pfxq.json'
park_data = JSON.parse(URI.open(url).read)

# Destroy existing parks and categories
Park.destroy_all
Category.destroy_all

# Seed Parks
park_data.each do |park|
  existing_park = Park.find_by(name: park['park_name'])
  unless existing_park
    Park.create!(
      name: park['park_name'],
      location_description: park['location_description'],
      park_category: park['park_category'],
      district: park['district'],
      classification_type: park['classification_type'],
      neighbourhood: park['neighbourhood'],
      latitude: park['location']['latitude'].to_f,
      longitude: park['location']['longitude'].to_f,
      address: park['location']['human_address'],
      amenities: park['location']['human_address'],
      size: 0
    )
  end
end

puts "Parks populated successfully."

# Define categories
locations = ["282 Niverville Ave", "1804 & 1820 Henderson Hwy", "546 Sherburn St", "23 Dickson Cres"]
neighbourhoods = ["Downtown", "West", "East", "North", "South"]
classification_types = ["Community", "Neighbourhood", "Linkage", "District D", "District E"]
districts = ["East", "West", "North", "South"]
park_categories = ["Playground", "Recreational Area", "Nature Reserve", "Picnic Area", "Dog Park"]

# Seed Categories
locations.each do |location|
  Category.create!(name: location)
end

neighbourhoods.each do |neighbourhood|
  Category.create!(name: neighbourhood)
end

classification_types.each do |classification|
  Category.create!(name: classification)
end

districts.each do |district|
  Category.create!(name: district)
end

park_categories.each do |category|
  Category.create!(name: category)
end

puts "Categories seeded successfully."
