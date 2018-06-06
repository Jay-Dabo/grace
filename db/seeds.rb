require "faker"
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
print "."

if Rails.env == "development"
  Member.destroy_all
  puts "Members"
  70.times do
    Member.create!(
      church_id: 1,
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      email: Faker::Internet.safe_email,
      phone: Faker::PhoneNumber.phone_number,
      birthday: Faker::Date.between(18.years.ago, 90.years.ago),
      address: Faker::Address.street_address,
      city: Faker::Address.city,
      state: Faker::Address.state,
      postal_code: Faker::Address.postcode
    )
    print "."
  end

  puts "Giving Types"
  GivingType.destroy_all
  10.times do
    GivingType.create!(
      church_id: 1,
      name: Faker::Commerce.department(2, true)
    )
    print "."
  end
  puts "All Done!"
end
