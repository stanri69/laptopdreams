require 'rails_helper'

RSpec.describe "processors/show", type: :view do
  before(:each) do
    assign(:processor, Processor.create!(
      name: "Name",
      operating_system: false,
      clock_frequency: 2,
      number_cores: "Number Cores"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Number Cores/)
  end
end
