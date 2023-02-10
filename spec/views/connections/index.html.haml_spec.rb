require 'rails_helper'

RSpec.describe "connections/index", type: :view do
  before(:each) do
    assign(:connections, [
      Connection.create!(
        network_adapters: false,
        ports: "Ports",
        wireless_communication: "Wireless Communication"
      ),
      Connection.create!(
        network_adapters: false,
        ports: "Ports",
        wireless_communication: "Wireless Communication"
      )
    ])
  end

  it "renders a list of connections" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new(false.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Ports".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Wireless Communication".to_s), count: 2
  end
end
