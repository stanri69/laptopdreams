require 'rails_helper'

RSpec.describe Battery, type: :model do
  describe 'relationships' do
    it {is_expected.to have_many :laptops}
  end

  it "is not valid without a battery_capacity" do
    expect(subject).to_not be_valid(battery_capacity: nil)
  end

  it "is not valid without a battery_life" do
    expect(subject).to_not be_valid(battery_life: nil)
  end
end
