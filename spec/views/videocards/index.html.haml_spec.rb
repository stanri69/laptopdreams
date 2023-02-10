require 'rails_helper'

RSpec.describe "videocards/index", type: :view do
  before(:each) do
    assign(:videocards, [
      Videocard.create!(
        type_videocard: "Type Videocard",
        name: "Name",
        description: "MyText",
        amount_memory: 2
      ),
      Videocard.create!(
        type_videocard: "Type Videocard",
        name: "Name",
        description: "MyText",
        amount_memory: 2
      )
    ])
  end

  it "renders a list of videocards" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Type Videocard".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
  end
end
