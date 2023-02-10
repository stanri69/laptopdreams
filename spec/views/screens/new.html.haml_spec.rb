require 'rails_helper'

RSpec.describe "screens/new", type: :view do
  before(:each) do
    assign(:screen, Screen.new(
      diagonal: "MyString",
      screen_type: "MyString",
      resolution: 1,
      refresh_rate: 1,
      built_camera: false
    ))
  end

  it "renders new screen form" do
    render

    assert_select "form[action=?][method=?]", screens_path, "post" do

      assert_select "input[name=?]", "screen[diagonal]"

      assert_select "input[name=?]", "screen[screen_type]"

      assert_select "input[name=?]", "screen[resolution]"

      assert_select "input[name=?]", "screen[refresh_rate]"

      assert_select "input[name=?]", "screen[built_camera]"
    end
  end
end
