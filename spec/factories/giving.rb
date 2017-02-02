# == Schema Information
#
# Table name: givings
#
#  id             :integer          not null, primary key
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  member_id      :integer
#  amount         :decimal(, )
#  date_given     :date
#  giving_type_id :integer
#  church_id      :integer
#
FactoryGirl.define do
  factory :giving do
    amount "20.00"
    date_given DateTime.now
    church
    giving_type
    member
  end
end
