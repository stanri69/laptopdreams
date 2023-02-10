require 'rails_helper'

RSpec.describe "connections/edit", type: :view do
  let(:connection) {
    Connection.create!(
      network_adapters: false,
      ports: "MyString",
      wireless_communication: "MyString"
    )
  }

  before(:each) do
    assign(:connection, connection)
  end

  it "renders the edit connection form" do
    render

    assert_select "form[action=?][method=?]", connection_path(connection), "post" do

      assert_select "input[name=?]", "connection[network_adapters]"

      assert_select "input[name=?]", "connection[ports]"

      assert_select "input[name=?]", "connection[wireless_communication]"
    end
  end
end
