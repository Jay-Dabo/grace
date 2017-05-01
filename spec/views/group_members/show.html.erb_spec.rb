require 'rails_helper'

RSpec.describe "group_members/show", type: :view do
  before(:each) do
    @group_member = assign(:group_member, GroupMember.create!(
      :group => nil,
      :member => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
