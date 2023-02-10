require 'rails_helper'

RSpec.describe "additionallies/show", type: :view do
  before(:each) do
    assign(:additionally, Additionally.create!(
      additionally_features: "Additionally Features",
      producing_country: "Producing Country",
      supply_set: "Supply Set",
      registration: "Registration",
      guarantee: "Guarantee"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Additionally Features/)
    expect(rendered).to match(/Producing Country/)
    expect(rendered).to match(/Supply Set/)
    expect(rendered).to match(/Registration/)
    expect(rendered).to match(/Guarantee/)
  end
end
