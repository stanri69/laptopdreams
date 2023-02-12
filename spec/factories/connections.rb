FactoryBot.define do
  factory :connection do
    network_adapters { true }
    ports { "1 x USB 3.2 Gen1 / 1 x USB 2.0 / 1 x USB 3.2 Type-C Gen1 / HDM" }
    wireless_communication { "Bluetooth 5.0 Wi-Fi 5" }
  end

  factory :invalid_connection, parent: :connection do
    network_adapters { nil }
    ports { nil }
    wireless_communication { nil }
  end
end
