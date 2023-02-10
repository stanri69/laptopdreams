require 'rails_helper'

RSpec.describe "dataloggers/index", type: :view do
  before(:each) do
    assign(:dataloggers, [
      Datalogger.create!(
        volume: 2,
        type_datalogger: "Type Datalogger"
      ),
      Datalogger.create!(
        volume: 2,
        type_datalogger: "Type Datalogger"
      )
    ])
  end

  it "renders a list of dataloggers" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Type Datalogger".to_s), count: 2
  end
end
