# == Schema Information
#
# Table name: members
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  name       :string(255)
#  gender     :string(255)
#  church_id  :integer
#

class Member < ActiveRecord::Base
  validates :name, :gender, presence: true
end
