# == Schema Information
#
# Table name: group_members
#
#  id         :integer          not null, primary key
#  group_id   :integer
#  member_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class GroupMember < ActiveRecord::Base
  belongs_to :group
  belongs_to :member
end
