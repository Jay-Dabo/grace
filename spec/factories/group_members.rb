# == Schema Information
#
# Table name: group_members
#
#  id         :bigint(8)        not null, primary key
#  group_id   :bigint(8)
#  member_id  :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :group_member do
    group nil
    member nil
  end
end
