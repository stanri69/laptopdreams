FactoryBot.define do
  factory :processor do
    name { "Hexanuclear AMD Ryzen 5 5500U (2.1 - 4.0 ГГц)" }
    operating_system { false }
    clock_frequency { 4 }
    number_cores { "6" }
  end

  factory :invalid_processor, parent: :processor do
    name { nil }
    operating_system { nil }
    clock_frequency { nil }
    number_cores { nil }
  end
end
