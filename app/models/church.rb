# == Schema Information
#
# Table name: churches
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  denomination :string(255)
#  church_image :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :integer
#

class Church < ActiveRecord::Base
  belongs_to :user
  has_many :members, dependent: :destroy
  has_many :givings, dependent: :destroy
  has_many :giving_types, dependent: :destroy
  mount_uploader :church_image, ChurchUploader

  validates :name, :denomination, :user_id, presence: true
end
