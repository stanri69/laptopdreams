require 'rails_helper'

RSpec.describe "rams/new", type: :view do
  before(:each) do
    assign(:ram, Ram.new(
      amount: 1,
      number_slot: 1,
      type_ram: "MyString"
    ))
  end

  it "renders new ram form" do
    render

    assert_select "form[action=?][method=?]", rams_path, "post" do

      assert_select "input[name=?]", "ram[amount]"

      assert_select "input[name=?]", "ram[number_slot]"

      assert_select "input[name=?]", "ram[type_ram]"
    end
  end
end
