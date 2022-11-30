# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'csv'
require 'open-uri'

puts "Creating User Artists"

filepath = File.join(Rails.root, 'db', 'users_all.csv')

CSV.foreach(filepath, headers: :first_row) do |row|
  user = User.new(
    first_name: row[0].gsub('“', '').gsub('”', ''),
    last_name: row[1].gsub('“', '').gsub('”', ''),
    # username: row[2].gsub('“', '').gsub('”', ''),
    password: 'Qwerty123!',
    password_confirmation: 'Qwerty123!',
    email: row[5].gsub('“', '').gsub('”', ''),
    location: Faker::Address.full_address,
    role: row[6].gsub('“', '').gsub('”', ''),
    phone_number: Faker::PhoneNumber.cell_phone
  )
  avatar = URI.open(row[7].gsub('“', '').gsub('”', ''))
  user.avatar.attach(io: avatar, filename: "avatar_#{user.id}_1.png", content_type: "image/jpg")
  puts "User saved? -> #{user.save!}"
  puts "User artist: #{user.id} created succesfully"


  artist = Artist.new(
    name: row[8].gsub('“', '').gsub('”', ''),
    genre: row[9].gsub('“', '').gsub('”', ''),
    description: row[22].gsub('“', '').gsub('”', ''),
    rate: row[18].gsub('“', '').gsub('”', ''),
    instrument: row[17].gsub('“', '').gsub('”', ''),
    soundcloud_url: row[11].gsub('“', '').gsub('”', ''),
    spotify_url: row[12].gsub('“', '').gsub('”', ''),
    bandcamp_url: row[13].gsub('“', '').gsub('”', ''),
    instagram_url: row[14].gsub('“', '').gsub('”', ''),
    tiktok_url: row[10].gsub('“', '').gsub('”', ''),
    is_group: true
  )

  artist.user = user
  puts "Artist profile saved? -> #{artist.save!}"
  puts "Artist: #{artist.id} created"

  image1 = URI.open(row[19].gsub('“', '').gsub('”', ''))
  image2 = URI.open(row[20].gsub('“', '').gsub('”', ''))
  image3 = URI.open(row[21].gsub('“', '').gsub('”', ''))

  artist.photos.attach(io: image1, filename: "artist_#{artist.id}_1.png", content_type: "image/jpg")
  artist.photos.attach(io: image2, filename: "artist_#{artist.id}_2.png", content_type: "image/jpg")
  artist.photos.attach(io: image3, filename: "artist_#{artist.id}_3.png", content_type: "image/jpg")
  puts '--------------------------------------'
  puts '--------------------------------------'
end

puts "Creating other users"
5.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  # username = "#{first_name}-#{last_name}"
  password = 'Qwerty123!'
  password_confirmation = 'Qwerty123!'
  email = "#{first_name}.#{last_name}@test.com"
  location = Faker::Address.full_address
  role = 'booker'
  phone_number = Faker::PhoneNumber.cell_phone
  user_params = { first_name:, last_name:, username:,
                  email:, password:, password_confirmation:, location:, role:, phone_number: }
  user = User.new(user_params)
  avatar = URI.open('https://mir-s3-cdn-cf.behance.net/project_modules/disp/371e2787529117.5dbad08246593.png')
  user.avatar.attach(io: avatar, filename: "user_avatar.png", content_type: "image/jpg")

  puts "User (other) saved? -> #{user.save!}"

  puts "User (other): #{user.id} created succesfully"
  puts '--------------------------------------'
  puts '--------------------------------------'
end

# user_params = { first_name: "John", last_name: "Mayer", username: "JohnMayer",
#   email: "john.mayer@gmail.com", password: '123123', password_confirmation: '123123', location: London, role: booker, phone_number: 07889974645 }
# user = User.new(user_params)
# avatar = URI.open('https://villagepipol.com/wp-content/uploads/2021/06/John-Mayer-FI.jpg')
# user.avatar.attach(io: avatar, filename: "john.jpg", content_type: "image/jpg")
# user.save
# puts "John Mayer created 🎸"

puts "Creating Reviews" # let's make 5 different USERS
50.times do # make 50 reviews
  user = User.find(rand(1..(User.all.length - 1)))
  artist = Artist.find(rand(1..(Artist.all.length - 1)))
  comment = Faker::Lorem.paragraph
  rating = rand(1..5)
  review_params = { comment:, rating:, user: }
  review = Review.new(review_params)
  review.artist = artist
  puts "Review saved? -> #{review.save!}"
  puts "Review: #{review.id} created"
  puts '--------------------------------------'
  puts '--------------------------------------'
end

# puts "Creating messages" # let's make 5 different USERS
# 80.times do # make some messages
#   user = User.find(rand(1..(User.all.length - 1)))
#   content = Faker::Lorem.sentences
#   dm_room_id = rand(1..80)
# end
