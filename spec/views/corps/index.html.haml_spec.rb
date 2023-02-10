require 'rails_helper'

RSpec.describe "corps/index", type: :view do
  before(:each) do
    assign(:corps, [
      Corp.create!(
        color: "Color",
        weight: 2,
        sound_system: "Sound System",
        manipulators: "Manipulators",
        dimensions: "Dimensions",
        body_material: "Body Material"
      ),
      Corp.create!(
        color: "Color",
        weight: 2,
        sound_system: "Sound System",
        manipulators: "Manipulators",
        dimensions: "Dimensions",
        body_material: "Body Material"
      )
    ])
  end

  it "renders a list of corps" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Color".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Sound System".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Manipulators".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Dimensions".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Body Material".to_s), count: 2
  end
end
