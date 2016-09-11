# == Schema Information
#
# Table name: givings
#
#  id             :integer          not null, primary key
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  member_id      :integer
#  amount         :decimal(, )
#  date_given     :date
#  giving_type_id :integer
#  church_id      :integer
#

class Giving < ActiveRecord::Base
  belongs_to :church
  belongs_to :member
  belongs_to :giving_type

  validates :church_id, :member_id, :giving_type_id, :amount, :date_given,
    presence: true
end
