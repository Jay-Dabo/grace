# == Schema Information
#
# Table name: churches
#
#  id           :bigint(8)        not null, primary key
#  name         :string
#  denomination :string
#  church_image :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Church < ApplicationRecord
  has_many :users, dependent: :destroy
  has_many :members, dependent: :destroy
  has_many :givings, dependent: :destroy
  has_many :giving_types, dependent: :destroy
  has_many :groups, dependent: :destroy
  has_one :subscription, dependent: :destroy
  mount_uploader :church_image, ChurchUploader

  validates :name, :denomination, presence: true
end
