require 'rails_helper'

RSpec.describe "giving_types/edit", type: :view do
  before(:each) do
    @giving_type = assign(:giving_type, GivingType.create!(
      :type => "",
      :church => nil
    ))
  end

  it "renders the edit giving_type form" do
    render

    assert_select "form[action=?][method=?]", giving_type_path(@giving_type), "post" do

      assert_select "input#giving_type_type[name=?]", "giving_type[type]"

      assert_select "input#giving_type_church_id[name=?]", "giving_type[church_id]"
    end
  end
end
