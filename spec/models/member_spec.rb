# == Schema Information
#
# Table name: members
#
#  id           :integer          not null, primary key
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  first_name   :string(255)
#  gender       :string(255)
#  church_id    :integer
#  email        :string(255)
#  phone        :string(255)
#  member_image :string(255)
#  birthday     :date
#  address      :string(255)
#  city         :string(255)
#  state        :string(255)
#  postal_code  :string(255)
#  last_name    :string(255)
#  interest     :text(65535)
#

require 'rails_helper'

RSpec.describe Member, type: :model do
  let(:member) { Member.new }

  context "New member without name and gender" do
    it "should not be valid" do
      expect(member.valid?).to be_falsey
    end

    it "should not save" do
      expect(member.save).to be_falsey
    end
  end

  context "New member with name and gender" do
    it "should be valid" do
      expect(member.valid?).to_be true
    end

    it "should save" do
      expect(member.save).to_be true
    end
  end
end
