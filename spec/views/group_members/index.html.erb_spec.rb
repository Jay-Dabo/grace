require 'rails_helper'

RSpec.describe "group_members/index", type: :view do
  before(:each) do
    assign(:group_members, [
      GroupMember.create!(
        :group => nil,
        :member => nil
      ),
      GroupMember.create!(
        :group => nil,
        :member => nil
      )
    ])
  end

  it "renders a list of group_members" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
