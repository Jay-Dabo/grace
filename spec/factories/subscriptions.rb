# == Schema Information
#
# Table name: subscriptions
#
#  id              :bigint(8)        not null, primary key
#  church_id       :bigint(8)
#  subscription_id :string
#  customer_id     :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  plan_id         :string
#  charge_amount   :integer
#

FactoryBot.define do
  factory :subscription do
    church nil
    subscription_id "MyString"
    customer_id "MyString"
  end
end
