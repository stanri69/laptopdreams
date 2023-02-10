require 'rails_helper'

RSpec.describe "additionallies/index", type: :view do
  before(:each) do
    assign(:additionallies, [
      Additionally.create!(
        additionally_features: "Additionally Features",
        producing_country: "Producing Country",
        supply_set: "Supply Set",
        registration: "Registration",
        guarantee: "Guarantee"
      ),
      Additionally.create!(
        additionally_features: "Additionally Features",
        producing_country: "Producing Country",
        supply_set: "Supply Set",
        registration: "Registration",
        guarantee: "Guarantee"
      )
    ])
  end

  it "renders a list of additionallies" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Additionally Features".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Producing Country".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Supply Set".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Registration".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Guarantee".to_s), count: 2
  end
end
