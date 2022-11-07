FactoryBot.define do
  factory :processor do
    name { "MyString" }
    operating_system { false }
    clock_frequency { 1 }
  end
end
