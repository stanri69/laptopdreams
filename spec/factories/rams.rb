FactoryBot.define do
  factory :ram do
    amount { 16 }
    number_slot { 1 }
    type_ram { "DDR4-3200 МГц" }
  end

  factory :invalid_ram, parent: :ram do
    amount { nil }
    number_slot { nil }
    type_ram { nil }
  end
end
