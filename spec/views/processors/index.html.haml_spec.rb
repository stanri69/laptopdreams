require 'rails_helper'

RSpec.describe "processors/index", type: :view do
  before(:each) do
    assign(:processors, [
      Processor.create!(
        name: "Name",
        operating_system: false,
        clock_frequency: 2,
        number_cores: "Number Cores"
      ),
      Processor.create!(
        name: "Name",
        operating_system: false,
        clock_frequency: 2,
        number_cores: "Number Cores"
      )
    ])
  end

  it "renders a list of processors" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(false.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Number Cores".to_s), count: 2
  end
end
