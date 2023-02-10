require 'rails_helper'

RSpec.describe "corps/edit", type: :view do
  let(:corp) {
    Corp.create!(
      color: "MyString",
      weight: 1,
      sound_system: "MyString",
      manipulators: "MyString",
      dimensions: "MyString",
      body_material: "MyString"
    )
  }

  before(:each) do
    assign(:corp, corp)
  end

  it "renders the edit corp form" do
    render

    assert_select "form[action=?][method=?]", corp_path(corp), "post" do

      assert_select "input[name=?]", "corp[color]"

      assert_select "input[name=?]", "corp[weight]"

      assert_select "input[name=?]", "corp[sound_system]"

      assert_select "input[name=?]", "corp[manipulators]"

      assert_select "input[name=?]", "corp[dimensions]"

      assert_select "input[name=?]", "corp[body_material]"
    end
  end
end
