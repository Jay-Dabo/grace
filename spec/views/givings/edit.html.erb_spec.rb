require 'rails_helper'

RSpec.describe "givings/edit", type: :view do
  before(:each) do
    @giving = assign(:giving, Giving.create!())
  end

  it "renders the edit giving form" do
    render

    assert_select "form[action=?][method=?]", giving_path(@giving), "post" do
    end
  end
end
