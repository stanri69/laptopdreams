require 'rails_helper'

RSpec.describe AdminUser, type: :model do
  it "is not valid without a email" do
    expect(subject).to_not be_valid(email: nil)
  end
end
