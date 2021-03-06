# == Schema Information
#
# Table name: groups
#
#  id          :bigint(8)        not null, primary key
#  name        :string
#  description :text
#  group_image :string
#  church_id   :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryBot.define do
  factory :group do
    name "MyString"
    description "MyText"
    group_image "MyString"
  end
end
