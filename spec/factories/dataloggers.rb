FactoryBot.define do
  factory :datalogger do
    volume { 512 }
    type_datalogger { "SSD" }
  end

  factory :invalid_datalogger, parent: :datalogger do
    volume { nil }
    type_datalogger { nil }
  end
end
