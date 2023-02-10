require 'rails_helper'

RSpec.describe "dataloggers/new", type: :view do
  before(:each) do
    assign(:datalogger, Datalogger.new(
      volume: 1,
      type_datalogger: "MyString"
    ))
  end

  it "renders new datalogger form" do
    render

    assert_select "form[action=?][method=?]", dataloggers_path, "post" do

      assert_select "input[name=?]", "datalogger[volume]"

      assert_select "input[name=?]", "datalogger[type_datalogger]"
    end
  end
end
