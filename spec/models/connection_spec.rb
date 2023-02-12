require 'rails_helper'

RSpec.describe Connection, type: :model do
  describe 'relationships' do
    it {is_expected.to have_many :laptops}
  end

  it "is not valid without a network_adapters" do
    expect(subject).to_not be_valid(network_adapters: nil)
  end

  it "is not valid without a ports" do
    expect(subject).to_not be_valid(ports: nil)
  end

  it "is not valid without a wireless_communication" do
    expect(subject).to_not be_valid(wireless_communication: nil)
  end
end
