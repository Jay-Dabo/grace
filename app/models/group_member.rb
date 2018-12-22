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

class GroupMember < ApplicationRecord
  belongs_to :group
  belongs_to :member

  def self.search(search)
    if search
      search_members(search)
    else
      all
    end
  end
end
