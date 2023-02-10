require 'rails_helper'

RSpec.describe "rams/index", type: :view do
  before(:each) do
    assign(:rams, [
      Ram.create!(
        amount: 2,
        number_slot: 3,
        type_ram: "Type Ram"
      ),
      Ram.create!(
        amount: 2,
        number_slot: 3,
        type_ram: "Type Ram"
      )
    ])
  end

  it "renders a list of rams" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(3.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Type Ram".to_s), count: 2
  end
end
