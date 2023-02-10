require 'rails_helper'

RSpec.describe "screens/edit", type: :view do
  let(:screen) {
    Screen.create!(
      diagonal: "MyString",
      screen_type: "MyString",
      resolution: 1,
      refresh_rate: 1,
      built_camera: false
    )
  }

  before(:each) do
    assign(:screen, screen)
  end

  it "renders the edit screen form" do
    render

    assert_select "form[action=?][method=?]", screen_path(screen), "post" do

      assert_select "input[name=?]", "screen[diagonal]"

      assert_select "input[name=?]", "screen[screen_type]"

      assert_select "input[name=?]", "screen[resolution]"

      assert_select "input[name=?]", "screen[refresh_rate]"

      assert_select "input[name=?]", "screen[built_camera]"
    end
  end
end
