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
#

require 'rails_helper'

RSpec.describe Subscription, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
