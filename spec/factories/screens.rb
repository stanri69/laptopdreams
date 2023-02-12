FactoryBot.define do
  factory :screen do
    diagonal { "15.6 (1920x1080) Full HD" }
    screen_type { "IPS" }
    resolution { 1920 }
    refresh_rate { 60 }
    built_camera { true }
  end

  factory :invalid_screen, parent: :screen do
    diagonal { nil }
    screen_type { nil }
    resolution { nil }
    refresh_rate { nil }
    built_camera { nil }
  end
end
