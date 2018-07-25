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

require 'rails_helper'

RSpec.describe GroupMember, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
