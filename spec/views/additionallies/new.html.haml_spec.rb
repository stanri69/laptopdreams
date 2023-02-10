require 'rails_helper'

RSpec.describe "additionallies/new", type: :view do
  before(:each) do
    assign(:additionally, Additionally.new(
      additionally_features: "MyString",
      producing_country: "MyString",
      supply_set: "MyString",
      registration: "MyString",
      guarantee: "MyString"
    ))
  end

  it "renders new additionally form" do
    render

    assert_select "form[action=?][method=?]", additionallies_path, "post" do

      assert_select "input[name=?]", "additionally[additionally_features]"

      assert_select "input[name=?]", "additionally[producing_country]"

      assert_select "input[name=?]", "additionally[supply_set]"

      assert_select "input[name=?]", "additionally[registration]"

      assert_select "input[name=?]", "additionally[guarantee]"
    end
  end
end
