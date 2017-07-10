# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require_relative 'seeders/dev_seeders/user_seeder'
require_relative 'seeders/dev_seeders/dances_seeder'
require_relative 'seeders/dev_seeders/dance_directions_seeder'
require_relative 'seeders/dev_seeders/comment_types_seeder'

if Rails.env.development?
  UserDevSeeder.seed!
  DanceDevSeeder.seed!
  DirectionDevSeeder.seed!
  CommentTypeDevSeeder.seed!
end

if Rails.env.production?
  UserDevSeeder.seed!
  DanceDevSeeder.seed!
  DirectionDevSeeder.seed!
  CommentTypeDevSeeder.seed!
end
