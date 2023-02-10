require 'rails_helper'

RSpec.describe "videocards/show", type: :view do
  before(:each) do
    assign(:videocard, Videocard.create!(
      type_videocard: "Type Videocard",
      name: "Name",
      description: "MyText",
      amount_memory: 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Type Videocard/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/2/)
  end
end
