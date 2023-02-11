FactoryBot.define do
  factory :user do
    email { "user@gmail.com" }
    password { 123123 }
  end

  factory :invalid_user, parent: :user do
    email { nil }
    password { nil }
  end
end
