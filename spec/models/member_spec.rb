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
