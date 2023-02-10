require 'rails_helper'

RSpec.describe "laptops/show", type: :view do
  before(:each) do
    assign(:laptop, Laptop.create!(
      full_name: "Full Name",
      price: 2,
      description: "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Full Name/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/MyText/)
  end
end
