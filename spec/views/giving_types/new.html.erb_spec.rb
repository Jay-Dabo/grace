require 'rails_helper'

RSpec.describe "giving_types/new", type: :view do
  before(:each) do
    assign(:giving_type, GivingType.new(
      :type => "",
      :church => nil
    ))
  end

  it "renders new giving_type form" do
    render

    assert_select "form[action=?][method=?]", giving_types_path, "post" do

      assert_select "input#giving_type_type[name=?]", "giving_type[type]"

      assert_select "input#giving_type_church_id[name=?]", "giving_type[church_id]"
    end
  end
end
