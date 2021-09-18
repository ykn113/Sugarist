# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Genre.create({ name: "焼き菓子"}) if !Genre.where(name: "焼き菓子").present?;
Genre.create({ name: "生菓子"}) if !Genre.where(name: "生菓子").present?;
Genre.create({ name: "パン"}) if !Genre.where(name: "パン").present?;
Genre.create({ name: "和菓子"}) if !Genre.where(name: "和菓子").present?;
