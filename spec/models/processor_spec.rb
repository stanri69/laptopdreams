require 'rails_helper'

RSpec.describe Processor, type: :model do
  describe 'relationships' do
    it {is_expected.to have_many :laptops}
  end

  it "is not valid without a name" do
    expect(subject).to_not be_valid(name: nil)
  end

  it "is not valid without a operating_system" do
    expect(subject).to_not be_valid(operating_system: nil)
  end

  it "is not valid without a clock_frequency" do
    expect(subject).to_not be_valid(clock_frequency: nil)
  end

  it "is not valid without a number_cores" do
    expect(subject).to_not be_valid(number_cores: nil)
  end
end
