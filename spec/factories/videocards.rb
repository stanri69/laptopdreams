FactoryBot.define do
  factory :videocard do
    type_videocard { "MyString" }
    name { "MyString" }
    description { "MyText" }
    amount_memory { 1 }
  end
end
