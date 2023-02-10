require 'rails_helper'

RSpec.describe "processors/new", type: :view do
  before(:each) do
    assign(:processor, Processor.new(
      name: "MyString",
      operating_system: false,
      clock_frequency: 1,
      number_cores: "MyString"
    ))
  end

  it "renders new processor form" do
    render

    assert_select "form[action=?][method=?]", processors_path, "post" do

      assert_select "input[name=?]", "processor[name]"

      assert_select "input[name=?]", "processor[operating_system]"

      assert_select "input[name=?]", "processor[clock_frequency]"

      assert_select "input[name=?]", "processor[number_cores]"
    end
  end
end
