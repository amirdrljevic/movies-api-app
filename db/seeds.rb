# Seed the database with some fake data
20.times do 
  Movie.create(
    name: Faker::Movie.unique.title,
    description: Faker::Movie.quote
  )
end