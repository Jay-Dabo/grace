require 'rails_helper'
require 'cancan/matchers'

RSpec.describe GivingsController, type: :controller do
  #describe with authorized user
  describe "with authorized user" do

    let(:user){ FactoryGirl.create(:super_admin) }
    let(:church){ FactoryGirl.create(:church, user_id: user.id) }
    let(:member){ FactoryGirl.create(:member, church_id: church.id) }
    let(:giving_type){ FactoryGirl.create(:giving_type, church_id: church.id) }
    let(:giving){ FactoryGirl.create(:giving, church_id: church.id, member_id: member.id, giving_type_id: giving_type.id) }

    before do
      sign_in user
    end

    #describe index action
    describe "GET #index" do
      before do
        get :index, church_id: church.id
      end

      it "sets the church" do
        expect(assigns(:church)).to eq(church)
      end

      it "has a 200 response code" do
        expect(response.status).to eq(200)
      end

      it "renders the index template" do
        expect(response).to render_template(:index)
      end
    end

    #describe show action
    describe "GET #show" do
      before do
        get :show, { id: giving.id, church_id: church.id }
      end

      it "has a 200 response code" do
        expect(response.status).to eq(200)
      end

      it "renders the show template" do
        expect(response).to render_template(:show)
      end
    end

    #describe new action
    describe "GET #new" do
      before do
        get :new, church_id: church.id
      end

      it "has a 200 response code" do
        expect(response.status).to eq(200)
      end

      it "should be a new giving" do
        expect(assigns(:giving)).to be_a_new(Giving)
      end
    end

    #describe create action
    describe "POST #new" do
      it "creates a new giving" do
        giving_params = FactoryGirl.attributes_for(:giving, church_id: church.id, member_id: member.id, giving_type_id: giving_type.id)
        expect{ post :create, church_id: church.id, giving: giving_params }.to change(Giving, :count).by(1)
      end
    end

  end
end
