require 'rails_helper'
require 'cancan/matchers'

RSpec.describe MembersController, type: :controller do
  #describe with authorized user
  describe "with authorized user" do
    let(:user){ FactoryGirl.create(:super_admin) }
    let(:church){ FactoryGirl.create(:church, user_id: user.id) }
    let(:member){ FactoryGirl.create(:member) }

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

      it "should render the index template" do
        expect(response).to render_template(:index)
      end
    end

    #describe show action
    describe "GET #show" do
      before do
        get :show, { id: member.id, church_id: church.id }
      end

      it "has a 200 response code" do
        expect(response.status).to eq(200)
      end

      it "should render the show template" do
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

      it "should render the new template" do
        expect(response).to render_template(:new)
      end

      it "should be a new member" do
        expect(assigns(:member)).to be_a_new(Member)
      end
    end

    #describe create action
    describe "POST #create" do
      it "creates a new member" do
        member_params = FactoryGirl.attributes_for(:member, church_id: church.id)
        expect{ post :create, church_id: church.id, member: member_params }.to change(Member, :count).by(1)
      end
    end

    #describe edit action
    describe "PUT #edit" do
      before do
        get :edit, { id: member.id, church_id: church.id }
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
        @church = FactoryGirl.create(:church)
        @member = FactoryGirl.create(:member, church_id: @church.id)
      end

      it "deletes a member" do
        expect{ delete :destroy, id: @member.id, church_id: @church.id }.to change(Member, :count).by(-1)
      end
    end
  end

  #test with super admin
  describe "with authorized user super admin" do
    let(:user){ FactoryGirl.create(:super_admin) }
    let(:ability){ Ability.new(user) }

    it "allows the super admin to manage any Member" do
      expect(ability).to be_able_to(:manage, Member.new)
    end
  end

  #test with admin
  describe "with authorized user admin" do
    let(:user){ FactoryGirl.create(:admin) }
    let(:church){ FactoryGirl.create(:church, user_id: user.id) }
    let(:ability){ Ability.new(user) }

    it "allows the admin to manage their Members" do
      expect(ability).to be_able_to(:manage, Member.new(church_id: church.id))
    end

    it "doesn't allow the admin to manage other churches Members" do
      expect(ability).to_not be_able_to(:manage, Member.new)
    end
  end
end
