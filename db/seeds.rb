# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
STDOUT.sync = true

puts "Super Admins"
User.find_or_create_by(email: "mike@mikelangston.me").update_attributes(password: "Nicole03", password_confirmation: "Nicole03", :confirmed_at => Date.yesterday)
u = User.find_by(email: "mike@mikelangston.me")
u.add_role("super_admin")
