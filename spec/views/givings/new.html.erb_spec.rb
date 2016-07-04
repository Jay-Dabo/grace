require 'rails_helper'

RSpec.describe "givings/new", type: :view do
  before(:each) do
    assign(:giving, Giving.new())
  end

  it "renders new giving form" do
    render

    assert_select "form[action=?][method=?]", givings_path, "post" do
    end
  end
end
