require 'rails_helper'

RSpec.describe "rams/edit", type: :view do
  let(:ram) {
    Ram.create!(
      amount: 1,
      number_slot: 1,
      type_ram: "MyString"
    )
  }

  before(:each) do
    assign(:ram, ram)
  end

  it "renders the edit ram form" do
    render

    assert_select "form[action=?][method=?]", ram_path(ram), "post" do

      assert_select "input[name=?]", "ram[amount]"

      assert_select "input[name=?]", "ram[number_slot]"

      assert_select "input[name=?]", "ram[type_ram]"
    end
  end
end
