# == Schema Information
#
# Table name: givings
#
#  id          :integer          not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  member_id   :integer
#  amount      :decimal(10, )
#  date_given  :date
#  giving_type :string(255)
#  church_id   :integer
#

class Giving < ActiveRecord::Base
  belongs_to :church
  belongs_to :member
  belongs_to :giving_type
end
