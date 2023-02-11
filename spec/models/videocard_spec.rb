require 'rails_helper'

RSpec.describe Videocard, type: :model do
  describe 'relationships' do
    it {is_expected.to have_many :laptops}
  end

  it "is not valid without a type_videocard" do
    expect(subject).to_not be_valid(type_videocard: nil)
  end

  it "is not valid without a name" do
    expect(subject).to_not be_valid(name: nil)
  end

  it "is not valid without a description" do
    expect(subject).to_not be_valid(description: nil)
  end

  it "is not valid without a amount_memory" do
    expect(subject).to_not be_valid(amount_memory: nil)
  end
end
