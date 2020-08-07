# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create(email: 'joshua.phelps89@gmail.com', password: 'test')

characters = MarvelApi.new.characters

characters['data']['results'].each do |char|
  Character.create(external_id: char['id'], name: char['name'], description: char['description'], image_url: char['thumbnail']['path'])
end 