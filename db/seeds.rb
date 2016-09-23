# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

50.times do |n|
  ing_ary = []
  3.times do
    ing_ary << Faker::Food.spice
  end
  spices = ing_ary.join(',')
  Recipe.create(
    user_id: Faker::Number.between(2,4),
    title: Faker::Food.ingredient,
    ingredients: spices,
    avg_rating: Faker::Number.between(1,5),
    nutrition_id:(n + 6),
    prep_time: Faker::Number.between(10,100)
  )
end
