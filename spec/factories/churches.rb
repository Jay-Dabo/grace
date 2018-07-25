# == Schema Information
#
# Table name: churches
#
#  id           :bigint(8)        not null, primary key
#  name         :string
#  denomination :string
#  church_image :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

FactoryBot.define do
  factory :church do
    name "Sample Church"
    denomination "Church of Christ"
    user
  end
end
