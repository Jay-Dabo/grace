require 'rails_helper'
require 'cancan/matchers'

RSpec.describe GivingsController, type: :controller do
  #describe with authorized user
  describe "with authorized user" do

    let(:user){ FactoryBot.create(:super_admin) }
    let(:church){ FactoryBot.create(:church, user_id: user.id) }
    let(:member){ FactoryBot.create(:member, church_id: church.id) }
    let(:giving_type){ FactoryBot.create(:giving_type, church_id: church.id) }
    let(:giving){ FactoryBot.create(:giving, church_id: church.id, member_id: member.id, giving_type_id: giving_type.id) }

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
    describe "POST #create" do
      it "creates a new giving" do
        giving_params = FactoryBot.attributes_for(:giving, church_id: church.id, member_id: member.id, giving_type_id: giving_type.id)
        expect{ post :create, church_id: church.id, giving: giving_params }.to change(Giving, :count).by(1)
      end
    end

    #describe edit action
    describe "PUT #edit" do
      before do
        get :edit, id: giving.id, church_id: church.id
      end

      it "has a 200 response code" do
        expect(response.status).to eq(200)
      end

      it "should render the edit template" do
        expect(response).to render_template(:edit)
      end
    end

    #describe destroy action
    describe "DELETE #destroy" do
      before do
        @giving = FactoryBot.create(:giving)
      end

      it "deletes a giving" do
        expect{ delete :destroy, id: @giving.id, church_id: church.id }.to change(Giving, :count).by(-1)
      end
    end

  end

  #test with super admin
  describe "with authorized user super_admin" do
    let(:user){ FactoryBot.create(:super_admin) }
    let(:ability){ Ability.new(user) }

    it "allows a super admin to manage any giving" do
      expect(ability).to be_able_to(:manage, Giving.new)
    end
  end

  #test with admin
  describe "with authorized user admin" do
    let(:user){ FactoryBot.create(:admin) }
    let(:church){ FactoryBot.create(:church, user_id: user.id) }
    let(:ability){ Ability.new(user) }

    it "allows an admin to manage their givings" do
      expect(ability).to be_able_to(:manage, Giving.new(church_id: church.id))
    end

    it "doesn't allow an admin to manage other churches givings" do
      expect(ability).to_not be_able_to(:manage, Giving.new)
    end
  end
end
