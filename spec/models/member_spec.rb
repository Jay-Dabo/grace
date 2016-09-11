# == Schema Information
#
# Table name: members
#
#  id           :integer          not null, primary key
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  first_name   :string
#  gender       :string
#  church_id    :integer
#  email        :string
#  phone        :string
#  member_image :string
#  birthday     :date
#  address      :string
#  city         :string
#  state        :string
#  postal_code  :string
#  last_name    :string
#  interest     :text
#

require 'rails_helper'

RSpec.describe Member, type: :model do

  let(:member) { Member.new }

  it { should belong_to(:church) }
  it { should have_many(:givings) }
  it { should validate_presence_of(:church_id) }
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:phone) }
  it { should validate_uniqueness_of(:email) }

  describe "full_name" do
    it "should add a space between first name and last name" do
      member.first_name = "Michael"
      member.last_name = "Langston"
      expect(member.full_name).to eq("Michael Langston")
    end
  end

  describe "full_address" do
    it "should add a space between all fields and a comma between city and state" do
      member.address = "468 Hunter Way"
      member.city = "Clayton"
      member.state = "NC"
      member.postal_code = "27520"
      expect(member.full_address).to eq("468 Hunter Way<br/>Clayton, NC 27520")
    end
  end

end
