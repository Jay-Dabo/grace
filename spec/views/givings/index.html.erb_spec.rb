require 'rails_helper'

RSpec.describe "givings/index", type: :view do
  before(:each) do
    assign(:givings, [
      Giving.create!(),
      Giving.create!()
    ])
  end

  it "renders a list of givings" do
    render
  end
end
