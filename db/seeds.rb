# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#  [["焼き菓子", "焼き菓子"], ["生菓子", "生菓子"], ["パン", "パン"]]

Genre.create([
  { name: "焼き菓子" },
  { name: "生菓子" },
  { name: "パン" }
])