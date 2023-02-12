require 'rails_helper'

RSpec.describe Screen, type: :model do
  describe 'relationships' do
    it {is_expected.to have_many :laptops}
  end

  it "is not valid without a diagonal" do
    expect(subject).to_not be_valid(diagonal: nil)
  end

  it "is not valid without a screen_type" do
    expect(subject).to_not be_valid(screen_type: nil)
  end

  it "is not valid without a resolution" do
    expect(subject).to_not be_valid(resolution: nil)
  end

  it "is not valid without a refresh_rate" do
    expect(subject).to_not be_valid(refresh_rate: nil)
  end

  it "is not valid without a built_camera" do
    expect(subject).to_not be_valid(built_camera: nil)
  end
end
