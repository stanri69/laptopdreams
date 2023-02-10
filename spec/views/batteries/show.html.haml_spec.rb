require 'rails_helper'

RSpec.describe "batteries/show", type: :view do
  before(:each) do
    assign(:battery, Battery.create!(
      battery_capacity: "Battery Capacity",
      battery_life: 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Battery Capacity/)
    expect(rendered).to match(/2/)
  end
end
