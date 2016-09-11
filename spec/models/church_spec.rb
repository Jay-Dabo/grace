# == Schema Information
#
# Table name: churches
#
#  id           :integer          not null, primary key
#  name         :string
#  denomination :string
#  church_image :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :integer
#

require 'rails_helper'

RSpec.describe Church, type: :model do

  it { should belong_to(:user) }
  it { should have_many(:members) }
  it { should have_many(:givings) }
  it { should have_many(:giving_types) }
  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:denomination) }

end
