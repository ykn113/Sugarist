# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Genre.create({ name: "スポンジケーキ"}) if !Genre.where(name: "スポンジケーキ").present?;
Genre.create({ name: "パウンドケーキ"}) if !Genre.where(name: "パウンドケーキ").present?;
Genre.create({ name: "クッキー・サブレ"}) if !Genre.where(name: "クッキー・サブレ").present?;
Genre.create({ name: "パイ・タルト"}) if !Genre.where(name: "パイ・タルト").present?;
Genre.create({ name: "マフィン"}) if !Genre.where(name: "マフィン").present?;
Genre.create({ name: "プリン・ゼリー"}) if !Genre.where(name: "プリン・ゼリー").present?;
Genre.create({ name: "チョコレート"}) if !Genre.where(name: "チョコレート").present?;
Genre.create({ name: "パン"}) if !Genre.where(name: "パン").present?;
Genre.create({ name: "和菓子"}) if !Genre.where(name: "和菓子").present?;
Genre.create({ name: "その他"}) if !Genre.where(name: "その他").present?;