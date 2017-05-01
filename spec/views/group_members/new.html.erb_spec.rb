require 'rails_helper'

RSpec.describe "group_members/new", type: :view do
  before(:each) do
    assign(:group_member, GroupMember.new(
      :group => nil,
      :member => nil
    ))
  end

  it "renders new group_member form" do
    render

    assert_select "form[action=?][method=?]", group_members_path, "post" do

      assert_select "input#group_member_group_id[name=?]", "group_member[group_id]"

      assert_select "input#group_member_member_id[name=?]", "group_member[member_id]"
    end
  end
end
