require 'rails_helper'

RSpec.describe "rams/show", type: :view do
  before(:each) do
    assign(:ram, Ram.create!(
      amount: 2,
      number_slot: 3,
      type_ram: "Type Ram"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/Type Ram/)
  end
end
