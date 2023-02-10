require 'rails_helper'

RSpec.describe "videocards/edit", type: :view do
  let(:videocard) {
    Videocard.create!(
      type_videocard: "MyString",
      name: "MyString",
      description: "MyText",
      amount_memory: 1
    )
  }

  before(:each) do
    assign(:videocard, videocard)
  end

  it "renders the edit videocard form" do
    render

    assert_select "form[action=?][method=?]", videocard_path(videocard), "post" do

      assert_select "input[name=?]", "videocard[type_videocard]"

      assert_select "input[name=?]", "videocard[name]"

      assert_select "textarea[name=?]", "videocard[description]"

      assert_select "input[name=?]", "videocard[amount_memory]"
    end
  end
end
