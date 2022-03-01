# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'factory_bot_rails'
include FactoryBot::Syntax::Methods

# ['Comedy', 'Horror', 'Action'].each do |genre|
#   Genre.create!(title: genre)

#   10.times do
#     Movie.create!(title: Faker::Movie.title, genre_id: Genre.last.id)
#   end
# end
3.times do
  genre = create(:genre)

  rand(3..7).times do
    create(:movie, genre: genre)
  end
end
