FactoryBot.define do
  factory :battery do
    battery_capacity { "58 Вт*год" }
    battery_life { 1 }
  end

  factory :invalid_battery, parent: :battery do
    battery_capacity { nil }
    battery_life { nil }
  end
end
