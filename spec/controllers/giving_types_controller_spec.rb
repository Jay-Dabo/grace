require 'rails_helper'

RSpec.describe GivingTypesController, type: :controller do
  describe "with authorized user" do

    let(:user){ FactoryGirl.create(:super_admin) }

    before do
      sign_in user
    end

  end
end
