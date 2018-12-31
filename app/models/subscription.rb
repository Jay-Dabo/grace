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

class Subscription < ApplicationRecord
  belongs_to :church

  validates :church_id, :subscription_id, :customer_id, :plan_id, :charge_amount, presence: true
end
