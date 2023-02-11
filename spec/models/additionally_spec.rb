require 'rails_helper'

RSpec.describe Additionally, type: :model do
  describe 'relationships' do
    it {is_expected.to have_many :laptops}
  end

  it "is not valid without a additionally_features" do
    expect(subject).to_not be_valid(additionally_features: nil)
  end

  it "is not valid without a producing_country" do
    expect(subject).to_not be_valid(producing_country: nil)
  end

  it "is not valid without a supply_set" do
    expect(subject).to_not be_valid(supply_set: nil)
  end

  it "is not valid without a registration" do
    expect(subject).to_not be_valid(registration: nil)
  end

  it "is not valid without a guarantee" do
    expect(subject).to_not be_valid(guarantee: nil)
  end
end
