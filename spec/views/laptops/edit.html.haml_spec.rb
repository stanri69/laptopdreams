require 'rails_helper'

RSpec.describe "laptops/edit", type: :view do
  let(:laptop) {
    Laptop.create!(
      full_name: "MyString",
      price: 1,
      description: "MyText"
    )
  }

  before(:each) do
    assign(:laptop, laptop)
  end

  it "renders the edit laptop form" do
    render

    assert_select "form[action=?][method=?]", laptop_path(laptop), "post" do

      assert_select "input[name=?]", "laptop[full_name]"

      assert_select "input[name=?]", "laptop[price]"

      assert_select "textarea[name=?]", "laptop[description]"
    end
  end
end
