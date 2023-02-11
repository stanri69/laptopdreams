FactoryBot.define do
  factory :additionally do
    additionally_features { "Webcam Built-in microphone Built-in speakers" }
    producing_country { "China" }
    supply_set { "Notebook Power adapter Documentation" }
    registration { "China" }
    guarantee { "12 months" }
  end

  factory :invalid_additionally, parent: :additionally do
    additionally_features { nil }
    producing_country { nil }
    supply_set { nil }
    registration { nil }
    guarantee { nil }
  end
end
