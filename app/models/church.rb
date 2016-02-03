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
#

class Church < ActiveRecord::Base
  belongs_to :user

  validates :name, :denomination, presence: true
end
