require 'rails_helper'

RSpec.describe "processors/edit", type: :view do
  let(:processor) {
    Processor.create!(
      name: "MyString",
      operating_system: false,
      clock_frequency: 1,
      number_cores: "MyString"
    )
  }

  before(:each) do
    assign(:processor, processor)
  end

  it "renders the edit processor form" do
    render

    assert_select "form[action=?][method=?]", processor_path(processor), "post" do

      assert_select "input[name=?]", "processor[name]"

      assert_select "input[name=?]", "processor[operating_system]"

      assert_select "input[name=?]", "processor[clock_frequency]"

      assert_select "input[name=?]", "processor[number_cores]"
    end
  end
end
