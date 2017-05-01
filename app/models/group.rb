# == Schema Information
#
# Table name: groups
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  group_image :string
#  church_id   :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Group < ActiveRecord::Base
  belongs_to :church
  has_many :group_members
  accepts_nested_attributes_for :group_members

  validates :name, presence: true
end
