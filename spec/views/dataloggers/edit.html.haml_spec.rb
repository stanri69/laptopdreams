require 'rails_helper'

RSpec.describe "dataloggers/edit", type: :view do
  let(:datalogger) {
    Datalogger.create!(
      volume: 1,
      type_datalogger: "MyString"
    )
  }

  before(:each) do
    assign(:datalogger, datalogger)
  end

  it "renders the edit datalogger form" do
    render

    assert_select "form[action=?][method=?]", datalogger_path(datalogger), "post" do

      assert_select "input[name=?]", "datalogger[volume]"

      assert_select "input[name=?]", "datalogger[type_datalogger]"
    end
  end
end
