require 'rails_helper'

RSpec.describe "churches/new", type: :view do
  before(:each) do
    assign(:church, Church.new(
      :name => "MyString",
      :denomination => "MyString",
      :church_image => "MyString"
    ))
  end

  it "renders new church form" do
    render

    assert_select "form[action=?][method=?]", churches_path, "post" do

      assert_select "input#church_name[name=?]", "church[name]"

      assert_select "input#church_denomination[name=?]", "church[denomination]"

      assert_select "input#church_church_image[name=?]", "church[church_image]"
    end
  end
end
