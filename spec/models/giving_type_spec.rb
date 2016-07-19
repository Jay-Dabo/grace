# == Schema Information
#
# Table name: giving_types
#
#  id          :integer          not null, primary key
#  giving_type :string(255)
#  church_id   :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe GivingType, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
