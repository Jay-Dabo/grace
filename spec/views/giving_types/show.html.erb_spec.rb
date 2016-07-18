require 'rails_helper'

RSpec.describe "giving_types/show", type: :view do
  before(:each) do
    @giving_type = assign(:giving_type, GivingType.create!(
      :type => "Type",
      :church => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Type/)
    expect(rendered).to match(//)
  end
end
