FactoryBot.define do
  factory :laptop do
    full_name { " Ноутбук Lenovo IdeaPad 3 " }
    price { 26999  }
    description { "good " }
    brand { "Lenovo " }
    op { "Windows " }
    type_laptop { "gaming" }
    additionally_id { 1 }
    battery_id { 1 }
    connection_id { 1 }
    corp_id { 1 }
    datalogger_id { 1 }
    processor_id { 1 }
    ram_id { 1 }
    screen_id { 1 }
    videocard_id { 1 }
    seller_id { 1 }
  end

  factory :invalid_laptop, parent: :laptop do
    full_name { nil }
    price { nil }
    description { nil }
    brand { nil }
    op { nil }
    type_laptop { nil }
    additionally_id { nil }
    battery_id { nil }
    connection_id { nil }
    corp_id { nil }
    datalogger_id { nil }
    processor_id { nil }
    ram_id { nil }
    screen_id { nil }
    videocard_id { nil }
    seller_id { nil }
  end
end
