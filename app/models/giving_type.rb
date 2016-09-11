# == Schema Information
#
# Table name: giving_types
#
#  id         :integer          not null, primary key
#  name       :string
#  church_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class GivingType < ActiveRecord::Base
  belongs_to :church
  has_many :givings, dependent: :destroy

  validates :church_id, :name, presence: true
end
