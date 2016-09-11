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

require 'rails_helper'

RSpec.describe Giving, type: :model do

  it { should belong_to(:church) }
  it { should belong_to(:member) }
  it { should belong_to(:giving_type) }
  it { should validate_presence_of(:church_id) }
  it { should validate_presence_of(:member_id) }
  it { should validate_presence_of(:giving_type_id) }
  it { should validate_presence_of(:amount) }
  it { should validate_presence_of(:date_given) }

end
