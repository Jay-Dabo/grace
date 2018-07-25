# == Schema Information
#
# Table name: giving_types
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  church_id  :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :giving_type do
    name "Offering"
    church
  end
end
