# == Schema Information
#
# Table name: giving_types
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  church_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe GivingType, type: :model do

  it { should belong_to(:church) }
  it { should have_many(:givings) }
  it { should validate_presence_of(:church_id) }
  it { should validate_presence_of(:name) }

end
