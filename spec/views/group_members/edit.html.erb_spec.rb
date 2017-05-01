require 'rails_helper'

RSpec.describe "group_members/edit", type: :view do
  before(:each) do
    @group_member = assign(:group_member, GroupMember.create!(
      :group => nil,
      :member => nil
    ))
  end

  it "renders the edit group_member form" do
    render

    assert_select "form[action=?][method=?]", group_member_path(@group_member), "post" do

      assert_select "input#group_member_group_id[name=?]", "group_member[group_id]"

      assert_select "input#group_member_member_id[name=?]", "group_member[member_id]"
    end
  end
end
