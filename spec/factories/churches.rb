# == Schema Information
#
# Table name: churches
#
#  id           :integer          not null, primary key
#  name         :string
#  denomination :string
#  church_image :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :integer
#

FactoryBot.define do
  factory :church do
    name "Sample Church"
    denomination "Church of Christ"
    user
  end
end
