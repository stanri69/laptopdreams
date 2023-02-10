require 'rails_helper'

RSpec.describe "screens/index", type: :view do
  before(:each) do
    assign(:screens, [
      Screen.create!(
        diagonal: "Diagonal",
        screen_type: "Screen Type",
        resolution: 2,
        refresh_rate: 3,
        built_camera: false
      ),
      Screen.create!(
        diagonal: "Diagonal",
        screen_type: "Screen Type",
        resolution: 2,
        refresh_rate: 3,
        built_camera: false
      )
    ])
  end

  it "renders a list of screens" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Diagonal".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Screen Type".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(3.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(false.to_s), count: 2
  end
end
