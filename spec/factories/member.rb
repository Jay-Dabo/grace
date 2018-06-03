# == Schema Information
#
# Table name: members
#
#  id           :integer          not null, primary key
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  first_name   :string
#  gender       :string
#  church_id    :integer
#  email        :string
#  phone        :string
#  member_image :string
#  birthday     :date
#  address      :string
#  city         :string
#  state        :string
#  postal_code  :string
#  last_name    :string
#  interest     :text
#
FactoryBot.define do
  factory :member do
    first_name "Mike"
    last_name "Langston"
    gender "Male"
    email "mike@mikelangston.me"
    phone "9195555555"
    birthday Date.new(1982, 9, 18)
    address "468 Hunter Way"
    city "Clayton"
    state "NC"
    postal_code "27520"
    church
  end
end
