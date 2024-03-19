# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# db/seeds.rb
require 'json'
require 'open-uri'
require 'faker'

# Pull data from Winnipeg Open Data API
url = 'https://data.winnipeg.ca/resource/tx3d-pfxq.json'

begin
  park_data = JSON.parse(URI.open(url).read)

  # Seed Parks
  park_data.each do |park|
    new_park = Park.create(
      name: park['park_name'],
      address: park['park_address'],
      latitude: park['latitude'].to_f,
      longitude: park['longitude'].to_f,
      size: park['park_size'],
      amenities: park['amenities']
    )

    # Generate fake events, activities, and facilities for each park
    3.times do
      new_park.events.create(
        name: Faker::Lorem.sentence,
        date: Faker::Date.between(from: Date.today, to: 1.year.from_now),
        time: Faker::Time.between(from: Time.now, to: Time.now + 1.week, format: :default),
        capacity: Faker::Number.between(from: 10, to: 100)
      )
    end

    3.times do
      new_park.activities.create(
        name: Faker::Lorem.word,
        description: Faker::Lorem.paragraph,
        duration: Faker::Number.between(from: 30, to: 180)
      )
    end

    3.times do
      new_park.facilities.create(
        name: Faker::Lorem.word,
        description: Faker::Lorem.sentence,
        capacity: Faker::Number.between(from: 1, to: 100)
      )
    end
  end
rescue Errno::ENOENT => e
  puts "Error: #{e.message}. Make sure the URL is correct and the file is accessible."
rescue JSON::ParserError => e
  puts "Error parsing JSON: #{e.message}. Make sure the data retrieved is in valid JSON format."
end
