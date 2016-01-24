require 'rails_helper'

RSpec.describe "churches/show", type: :view do
  before(:each) do
    @church = assign(:church, Church.create!(
      :name => "Name",
      :denomination => "Denomination",
      :church_image => "Church Image"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Denomination/)
    expect(rendered).to match(/Church Image/)
  end
end
