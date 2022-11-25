FactoryBot.define do
  factory :connection do
    network_adapters { false }
    ports { "MyString" }
    wireless_communication { "MyString" }
  end
end
