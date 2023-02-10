require 'rails_helper'

RSpec.describe "dataloggers/show", type: :view do
  before(:each) do
    assign(:datalogger, Datalogger.create!(
      volume: 2,
      type_datalogger: "Type Datalogger"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Type Datalogger/)
  end
end
