require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'relationships' do
    it {is_expected.to have_many :favorites}
  end

  it "is not valid without a email" do
    expect(subject).to_not be_valid(email: nil)
  end

  describe 'testing password user' do
    it "is not valid without a encrypted_password" do
      expect(subject).to_not be_valid(encrypted_password: nil)
    end

    it "is not valid without a reset_password_token" do
      expect(subject).to_not be_valid(reset_password_token: nil)
    end

    it "is not valid without a password" do
      expect(subject).to_not be_valid(password: nil)
    end
  end
end
