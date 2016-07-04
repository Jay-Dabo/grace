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
#  user_id      :integer
#

require 'rails_helper'

RSpec.describe Church, type: :model do
  # Create a church to use with test
  let (:church) { Church.new }

  context "New Church without required fields" do
    it "should not be valid" do
      expect(church.valid?).to be_falsey
    end

    it "should not save" do
      expect(church.save).to be_falsey
    end
  end

  context "New Church with required fields" do
    # Add name and denomination to test
    before do
      church.user_id = 1
      church.name = "SCCC"
      church.denomination = "Non-Denominational"
    end

    it "should have a user_id" do
      expect(church.user_id).to equal(1)
    end

    it "should be valid" do
      expect(church.valid?).to be_truthy
    end

    it "should save" do
      expect(church.save).to be_truthy
    end
  end
end
