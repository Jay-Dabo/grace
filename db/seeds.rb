# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
STDOUT.sync = true

puts "Super Admins"
User.find_or_create_by(first_name: "Mike").update_attributes(:last_name => "", :email => "", :password => "", :password_confirmation => "")
