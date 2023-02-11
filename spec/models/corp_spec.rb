require 'rails_helper'

RSpec.describe Corp, type: :model do
  describe 'relationships' do
    it {is_expected.to have_many :laptops}
  end

  it "is not valid without a color" do
    expect(subject).to_not be_valid(color: nil)
  end

  it "is not valid without a weight" do
    expect(subject).to_not be_valid(weight: nil)
  end

  it "is not valid without a sound_system" do
    expect(subject).to_not be_valid(sound_system: nil)
  end

  it "is not valid without a manipulators" do
    expect(subject).to_not be_valid(manipulators: nil)
  end

  it "is not valid without a dimensions" do
    expect(subject).to_not be_valid(dimensions: nil)
  end

  it "is not valid without a body_material" do
    expect(subject).to_not be_valid(body_material: nil)
  end
end
