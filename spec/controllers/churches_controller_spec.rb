require 'rails_helper'

RSpec.describe ChurchesController, type: :controller do

  describe "with authorized user" do
    let(:user){ FactoryGirl.create(:super_admin) }
    before do
      sign_in user
    end

    describe "GET index" do
      it "has a 200 response status" do
        get :index
        expect(response.status).to eq(200)
      end

      it "renders the index template" do
        get :index
        expect(response).to render_template(:index)
      end
    end

    describe "GET edit" do
      let(:church){ FactoryGirl.create(:church) }
      it "has a 200 response status" do
        get :edit, id: church
        expect(response.status).to eq(200)
      end
    end

  end

end
