require 'rails_helper'

RSpec.describe "videocards/new", type: :view do
  before(:each) do
    assign(:videocard, Videocard.new(
      type_videocard: "MyString",
      name: "MyString",
      description: "MyText",
      amount_memory: 1
    ))
  end

  it "renders new videocard form" do
    render

    assert_select "form[action=?][method=?]", videocards_path, "post" do

      assert_select "input[name=?]", "videocard[type_videocard]"

      assert_select "input[name=?]", "videocard[name]"

      assert_select "textarea[name=?]", "videocard[description]"

      assert_select "input[name=?]", "videocard[amount_memory]"
    end
  end
end
