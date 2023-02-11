FactoryBot.define do
  factory :seller do
    email { "dealer@gmail.com" }
    password { 123123 }
  end

  factory :invalid_seller, parent: :seller do
    email { nil }
    password { nil }
  end
end
