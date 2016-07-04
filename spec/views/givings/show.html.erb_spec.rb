require 'rails_helper'

RSpec.describe "givings/show", type: :view do
  before(:each) do
    @giving = assign(:giving, Giving.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
