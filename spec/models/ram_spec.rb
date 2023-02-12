require 'rails_helper'

RSpec.describe Ram, type: :model do
  describe 'relationships' do
    it {is_expected.to have_many :laptops}
  end

  it "is not valid without a amount" do
    expect(subject).to_not be_valid(amount: nil)
  end

  it "is not valid without a number_slot" do
    expect(subject).to_not be_valid(number_slot: nil)
  end

  it "is not valid without a type_ram" do
    expect(subject).to_not be_valid(type_ram: nil)
  end
end
