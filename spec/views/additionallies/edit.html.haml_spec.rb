require 'rails_helper'

RSpec.describe "additionallies/edit", type: :view do
  let(:additionally) {
    Additionally.create!(
      additionally_features: "MyString",
      producing_country: "MyString",
      supply_set: "MyString",
      registration: "MyString",
      guarantee: "MyString"
    )
  }

  before(:each) do
    assign(:additionally, additionally)
  end

  it "renders the edit additionally form" do
    render

    assert_select "form[action=?][method=?]", additionally_path(additionally), "post" do

      assert_select "input[name=?]", "additionally[additionally_features]"

      assert_select "input[name=?]", "additionally[producing_country]"

      assert_select "input[name=?]", "additionally[supply_set]"

      assert_select "input[name=?]", "additionally[registration]"

      assert_select "input[name=?]", "additionally[guarantee]"
    end
  end
end
