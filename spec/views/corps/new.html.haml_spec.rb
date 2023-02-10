require 'rails_helper'

RSpec.describe "corps/new", type: :view do
  before(:each) do
    assign(:corp, Corp.new(
      color: "MyString",
      weight: 1,
      sound_system: "MyString",
      manipulators: "MyString",
      dimensions: "MyString",
      body_material: "MyString"
    ))
  end

  it "renders new corp form" do
    render

    assert_select "form[action=?][method=?]", corps_path, "post" do

      assert_select "input[name=?]", "corp[color]"

      assert_select "input[name=?]", "corp[weight]"

      assert_select "input[name=?]", "corp[sound_system]"

      assert_select "input[name=?]", "corp[manipulators]"

      assert_select "input[name=?]", "corp[dimensions]"

      assert_select "input[name=?]", "corp[body_material]"
    end
  end
end
