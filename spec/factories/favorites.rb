FactoryBot.define do
  factory :favorite do
    laptop { 1 }
    user { 1 }
  end

  factory :invalid_favorite, parent: :favorite do
    laptop { nil }
    user { nil }
  end
end
