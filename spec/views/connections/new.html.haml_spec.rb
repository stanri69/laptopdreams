require 'rails_helper'

RSpec.describe "connections/new", type: :view do
  before(:each) do
    assign(:connection, Connection.new(
      network_adapters: false,
      ports: "MyString",
      wireless_communication: "MyString"
    ))
  end

  it "renders new connection form" do
    render

    assert_select "form[action=?][method=?]", connections_path, "post" do

      assert_select "input[name=?]", "connection[network_adapters]"

      assert_select "input[name=?]", "connection[ports]"

      assert_select "input[name=?]", "connection[wireless_communication]"
    end
  end
end
