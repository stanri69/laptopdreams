require 'rails_helper'

RSpec.describe "corps/show", type: :view do
  before(:each) do
    assign(:corp, Corp.create!(
      color: "Color",
      weight: 2,
      sound_system: "Sound System",
      manipulators: "Manipulators",
      dimensions: "Dimensions",
      body_material: "Body Material"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Color/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Sound System/)
    expect(rendered).to match(/Manipulators/)
    expect(rendered).to match(/Dimensions/)
    expect(rendered).to match(/Body Material/)
  end
end
