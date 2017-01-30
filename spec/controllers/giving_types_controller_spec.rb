require 'rails_helper'
require 'cancan/matchers'

RSpec.describe GivingTypesController, type: :controller do
  #Test with authorized user
  describe "with authorized user" do

    let(:user){ FactoryGirl.create(:super_admin) }
    let(:church){ FactoryGirl.create(:church, user_id: user.id) }
    let(:giving_type){ FactoryGirl.create(:giving_type, church_id: church.id) }

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

  end #end authorized user

  #Test with Super Admin
  describe "with authorized user Super Admin" do
    let(:user){ FactoryGirl.create(:super_admin) }
    let(:ability){ Ability.new(user) }

    it "allows the super admin to manage giving types" do
      expect(ability).to be_able_to(:manage, GivingType.new)
    end
  end #end authorized user super_admin

  #Test with Admin
  describe "with authorized user Admin" do
    let(:user){ FactoryGirl.create(:admin) }
    let(:church){ FactoryGirl.create(:church, user_id: user.id) }
    let(:ability){ Ability.new(user) }

    it "allows the admin to manage their giving types" do
      expect(ability).to be_able_to(:manage, GivingType.new(church_id: church.id))
    end

    it "doesn't allows the admin to manage other churches giving types" do
      expect(ability).to_not be_able_to(:manage, GivingType.new)
    end
  end #end authorized user admin

  #Test with Admin Assistant
  describe "with authorized user Assistant" do

  end #end authorized user assistant
end
