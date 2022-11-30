# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


user_params = {
  first_name: 'Bob',
  last_name: 'Guitar',
  email: 'bob.guitar@guimail.com',
  phone_number: '063423432443',
  password: '123123',
  password_confirmation: '123123'
}
User.create(user_params)

user_params2 = {
  first_name: 'Rob',
  last_name: 'Bass',
  email: 'rob.bass@bassmail.com',
  phone_number: '06098732443',
  password: '123123',
  password_confirmation: '123123'
}
User.create(user_params2)
