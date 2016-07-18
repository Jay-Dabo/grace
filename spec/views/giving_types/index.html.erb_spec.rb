require 'rails_helper'

RSpec.describe "giving_types/index", type: :view do
  before(:each) do
    assign(:giving_types, [
      GivingType.create!(
        :type => "Type",
        :church => nil
      ),
      GivingType.create!(
        :type => "Type",
        :church => nil
      )
    ])
  end

  it "renders a list of giving_types" do
    render
    assert_select "tr>td", :text => "Type".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
