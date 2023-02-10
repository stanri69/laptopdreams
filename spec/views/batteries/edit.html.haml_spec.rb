require 'rails_helper'

RSpec.describe "batteries/edit", type: :view do
  let(:battery) {
    Battery.create!(
      battery_capacity: "MyString",
      battery_life: 1
    )
  }

  before(:each) do
    assign(:battery, battery)
  end

  it "renders the edit battery form" do
    render

    assert_select "form[action=?][method=?]", battery_path(battery), "post" do

      assert_select "input[name=?]", "battery[battery_capacity]"

      assert_select "input[name=?]", "battery[battery_life]"
    end
  end
end
