require 'rails_helper'

RSpec.describe Laptop, type: :model do
  describe 'relationships' do
    it {is_expected.to belong_to :battery}
    it {is_expected.to belong_to :datalogger}
    it {is_expected.to belong_to :ram}
    it {is_expected.to belong_to :processor}
    it {is_expected.to belong_to :connection}
    it {is_expected.to belong_to :additionally}
    it {is_expected.to belong_to :corp}
    it {is_expected.to belong_to :screen}
    it {is_expected.to belong_to :videocard}
    it {is_expected.to belong_to :seller}
    it {is_expected.to have_one_attached :image}
    it {is_expected.to have_many :favorites}
  end

  it "is not valid without a full_name" do
    expect(subject).to_not be_valid(full_name: nil)
  end

  it "is not valid without a price" do
    expect(subject).to_not be_valid(price: nil)
  end

  it "is not valid without a description" do
    expect(subject).to_not be_valid(description: nil)
  end

  it "is not valid without a brand" do
    expect(subject).to_not be_valid(brand: nil)
  end

  it "is not valid without a op" do
    expect(subject).to_not be_valid(op: nil)
  end

  it "is not valid without a type_laptop" do
    expect(subject).to_not be_valid(type_laptop: nil)
  end

  it "is not valid without a screen_id" do
    expect(subject).to_not be_valid(screen_id: nil)
  end

  it "is not valid without a additionally_id" do
    expect(subject).to_not be_valid(additionally_id: nil)
  end

  it "is not valid without a battery_id" do
    expect(subject).to_not be_valid(battery_id: nil)
  end

  it "is not valid without a connection_id" do
    expect(subject).to_not be_valid(connection_id: nil)
  end

  it "is not valid without a corp_id" do
    expect(subject).to_not be_valid(corp_id: nil)
  end

  it "is not valid without a datalogger_id" do
    expect(subject).to_not be_valid(datalogger_id: nil)
  end

  it "is not valid without a processor_id" do
    expect(subject).to_not be_valid(processor_id: nil)
  end

  it "is not valid without a ram_id" do
    expect(subject).to_not be_valid(ram_id: nil)
  end

  it "is not valid without a videocard_id" do
    expect(subject).to_not be_valid(videocard_id: nil)
  end

  it "is not valid without a seller_id" do
    expect(subject).to_not be_valid(seller_id: nil)
  end
end
