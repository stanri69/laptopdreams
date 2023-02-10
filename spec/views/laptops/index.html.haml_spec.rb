require 'rails_helper'

RSpec.describe "laptops/index", type: :view do
  before(:each) do
    assign(:laptops, [
      Laptop.create!(
        full_name: "Full Name",
        price: 2,
        description: "MyText"
      ),
      Laptop.create!(
        full_name: "Full Name",
        price: 2,
        description: "MyText"
      )
    ])
  end

  it "renders a list of laptops" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Full Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
  end
end
