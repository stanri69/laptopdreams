require 'rails_helper'

RSpec.describe Datalogger, type: :model do
  describe 'relationships' do
    it {is_expected.to have_many :laptops}
  end

  it "is not valid without a volume" do
    expect(subject).to_not be_valid(volume: nil)
  end

  it "is not valid without a type_datalogger" do
    expect(subject).to_not be_valid(type_datalogger: nil)
  end
end
