require 'rails_helper'
require 'cancan/matchers'

RSpec.describe ChurchesController, type: :controller do
  #Test with authorized user
  describe "with authorized user" do
    let(:user){ FactoryGirl.create(:super_admin) }
    before do
      sign_in user
    end

    #test the index action
    describe "GET #index" do
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
    describe "GET #show" do
      let(:church){ FactoryGirl.create(:church) }

      it "has a 200 response status" do
        get :show, id: church
        expect(response.status).to eq(200)
      end

      it "renders the show template" do
        get :show, id: church
        expect(response).to render_template(:show)
      end
    end

    #test the new action
    describe "GET #new" do
      it "has a 200 response status" do
        get :new
        expect(response.status).to eq(200)
      end

      it "should be a new church" do
        get :new
        expect(assigns(:church)).to be_a_new(Church)
      end
    end

    #test the create action
    describe "POST #create" do
      it "creates a new church" do
        church_params = FactoryGirl.attributes_for(:church)
        expect{ post :create, church: church_params }.to change(Church, :count).by(1)
      end
    end

    #test the edit action
    describe "PUT #edit" do
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

    #test the delete action
    describe "DELETE #destroy" do
      before do
        @church = FactoryGirl.create(:church)
      end
      
      it "deletes a church" do
        expect{ delete :destroy, id: @church.id }.to change(Church, :count).by(-1)
      end
    end

  end #end authorized user

  #Test with Super Admin
  describe "with authorized user Super Admin" do
    let(:user){ FactoryGirl.create(:super_admin) }
    let(:ability){ Ability.new(user) }

    it "allows the super admin to manage any church" do
      expect(ability).to be_able_to(:manage, Church.new)
    end
  end #end authorized user super_admin

  #Test with Admin
  describe "with authorized user Admin" do
    let(:user){ FactoryGirl.create(:admin) }
    let(:ability){ Ability.new(user) }

    it "allows the admin to manage their church" do
      expect(ability).to be_able_to(:manage, Church.new(user: user))
    end

    it "doesn't allow admin to manage other churches" do
      expect(ability).to_not be_able_to(:manage, Church.new)
    end
  end #end authorized user admin

  #Test with Admin Assistant
  describe "with authorized user Assistant" do

  end #end authorized user assistant
end
