FactoryBot.define do
  factory :screen do
    diagonal { "MyString" }
    screen_type { "MyString" }
    resolution { 1 }
    refresh_rate { 1 }
    built_camera { false }
  end
end
