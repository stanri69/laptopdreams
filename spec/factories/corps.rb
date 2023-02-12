FactoryBot.define do
  factory :corp do
    color { "red" }
    weight { 1 }
    sound_system { "sound_system" }
    manipulators { "Touch" }
    dimensions { "359.2 x 236.5 x 19.9 мм" }
    body_material { "Plastic" }
  end

  factory :invalid_corp, parent: :corp do
    color { nil }
    weight { nil }
    sound_system { nil }
    manipulators { nil }
    dimensions { nil }
    body_material { nil }
  end
end
