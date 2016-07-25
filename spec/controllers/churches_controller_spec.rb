require 'rails_helper'

RSpec.describe ChurchesController, type: :controller do

  describe "with authorized user" do
    let(:user){ FactoryGirl.create(:super_admin) }
    before do
      sign_in user
    end

    #test the index action
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

    #test the show action
    describe "GET show" do
      let(:church){ FactoryGirl.create(:church) }
      it "redirects to index action" do
        get :show, id: church
        expect(response).to redirect_to(action: :index)
      end
    end

    #text the edit action
    describe "GET edit" do
      let(:church){ FactoryGirl.create(:church) }
      it "has a 200 response status" do
        get :edit, id: church
        expect(response.status).to eq(200)
      end

      it "renders the edit template" do
        get :edit, id: church
        expect(response).to render_template(:edit)
      end
    end

  end

end
