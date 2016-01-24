require 'rails_helper'

RSpec.describe Church, type: :model do
  let (:church) { Church.new }

  context "New Church without name or denomination" do
    it "should not be valid" do
      expect(church.valid?).to be_falsey
    end

    it "should not save" do
      expect(church.save).to be_falsey
    end
  end

  context "New Church with name and denomination" do
    before do
      church.name = "SCCC"
      church.denomination = "Non-Denominational"
    end

    it "should be valid" do
      expect(church.valid?).to be true
    end

    it "should save" do
      expect(church.save).to be true
    end
  end
end
