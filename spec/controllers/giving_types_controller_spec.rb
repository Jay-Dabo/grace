require 'rails_helper'

RSpec.describe GivingTypesController, type: :controller do
  describe "with authorized user" do

    let(:user){ FactoryGirl.create(:super_admin) }
    let(:church){ FactoryGirl.create(:church, user_id: user.id) }
    let(:giving_type){ FactoryGirl.create(:giving_type, church_id: church.id)}

    before do
      sign_in user
    end

    describe "GET #index" do
      before do
        get :index, church_id: church.id
      end

      it "sets the church" do
        expect(assigns(:church)).to eq(church)
      end

      it "has a 200 response status" do
        expect(response.status).to eq(200)
      end

      it "renders the index template" do
        expect(response).to render_template(:index)
      end
    end

    describe "GET #show" do
      before do
        get :show, { id: giving_type.id, church_id: church.id }
      end

      it "has a 200 response status" do
        expect(response.status).to eq(200)
      end

      it "renders the show template" do
        expect(response).to render_template(:show)
      end
    end

  end
end
