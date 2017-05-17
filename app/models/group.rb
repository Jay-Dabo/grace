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
  has_many :group_members, dependent: :destroy
  mount_uploader :group_image, GroupUploader
  #accepts_nested_attributes_for :group_members

  validates :name, presence: true

  def self.search(search)
    if search
      search_members(search)
    else
      all
    end
  end
end
