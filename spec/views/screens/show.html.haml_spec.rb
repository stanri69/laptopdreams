require 'rails_helper'

RSpec.describe "screens/show", type: :view do
  before(:each) do
    assign(:screen, Screen.create!(
      diagonal: "Diagonal",
      screen_type: "Screen Type",
      resolution: 2,
      refresh_rate: 3,
      built_camera: false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Diagonal/)
    expect(rendered).to match(/Screen Type/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/false/)
  end
end
