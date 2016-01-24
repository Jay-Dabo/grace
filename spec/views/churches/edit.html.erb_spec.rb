require 'rails_helper'

RSpec.describe "churches/edit", type: :view do
  before(:each) do
    @church = assign(:church, Church.create!(
      :name => "MyString",
      :denomination => "MyString",
      :church_image => "MyString"
    ))
  end

  it "renders the edit church form" do
    render

    assert_select "form[action=?][method=?]", church_path(@church), "post" do

      assert_select "input#church_name[name=?]", "church[name]"

      assert_select "input#church_denomination[name=?]", "church[denomination]"

      assert_select "input#church_church_image[name=?]", "church[church_image]"
    end
  end
end
