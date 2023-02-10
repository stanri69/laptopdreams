require 'rails_helper'

RSpec.describe "laptops/new", type: :view do
  before(:each) do
    assign(:laptop, Laptop.new(
      full_name: "MyString",
      price: 1,
      description: "MyText"
    ))
  end

  it "renders new laptop form" do
    render

    assert_select "form[action=?][method=?]", laptops_path, "post" do

      assert_select "input[name=?]", "laptop[full_name]"

      assert_select "input[name=?]", "laptop[price]"

      assert_select "textarea[name=?]", "laptop[description]"
    end
  end
end
