require 'rails_helper'

RSpec.describe "batteries/new", type: :view do
  before(:each) do
    assign(:battery, Battery.new(
      battery_capacity: "MyString",
      battery_life: 1
    ))
  end

  it "renders new battery form" do
    render

    assert_select "form[action=?][method=?]", batteries_path, "post" do

      assert_select "input[name=?]", "battery[battery_capacity]"

      assert_select "input[name=?]", "battery[battery_life]"
    end
  end
end
