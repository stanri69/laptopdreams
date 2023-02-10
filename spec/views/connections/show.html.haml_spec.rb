require 'rails_helper'

RSpec.describe "connections/show", type: :view do
  before(:each) do
    assign(:connection, Connection.create!(
      network_adapters: false,
      ports: "Ports",
      wireless_communication: "Wireless Communication"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/false/)
    expect(rendered).to match(/Ports/)
    expect(rendered).to match(/Wireless Communication/)
  end
end
