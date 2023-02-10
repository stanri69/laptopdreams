require 'rails_helper'

RSpec.describe "batteries/index", type: :view do
  before(:each) do
    assign(:batteries, [
      Battery.create!(
        battery_capacity: "Battery Capacity",
        battery_life: 2
      ),
      Battery.create!(
        battery_capacity: "Battery Capacity",
        battery_life: 2
      )
    ])
  end

  it "renders a list of batteries" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Battery Capacity".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
  end
end
