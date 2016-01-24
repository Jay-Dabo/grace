require 'rails_helper'

RSpec.describe "churches/index", type: :view do
  before(:each) do
    assign(:churches, [
      Church.create!(
        :name => "Name",
        :denomination => "Denomination",
        :church_image => "Church Image"
      ),
      Church.create!(
        :name => "Name",
        :denomination => "Denomination",
        :church_image => "Church Image"
      )
    ])
  end

  it "renders a list of churches" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Denomination".to_s, :count => 2
    assert_select "tr>td", :text => "Church Image".to_s, :count => 2
  end
end
