FactoryBot.define do
  factory :videocard do
    type_videocard { "Integrated video card" }
    name { "Sapphire Radeon" }
    description { "Екран 15.6 IPS (1920x1080) Full HD, матовий / AMD Ryzen 5 5500U (2.1 - 4.0 ГГц) / RAM" }
    amount_memory { 16 }
  end

  factory :invalid_videocard, parent: :videocard do
    type_videocard { nil }
    name { nil }
    description { nil }
    amount_memory { nil }
  end
end
