require 'rails_helper'

RSpec.describe Favorite, type: :model do
  describe 'relationships' do
    it {is_expected.to belong_to :laptop}
    it {is_expected.to belong_to :user}
  end

  it "is not valid without a laptop_id" do
    expect(subject).to_not be_valid(laptop_id: nil)
  end

  it "is not valid without a user_id" do
    expect(subject).to_not be_valid(user_id: nil)
  end
end
