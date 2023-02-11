# require 'faker'
#
# additionally = Additionally.create!(
#  additionally_features: 'Webcam Built-in microphone Built-in speakers',
#  producing_country: 'China',
#  supply_set: 'Notebook Power adapter Documentation',
#  registration: 'China',
# guarantee: '12 months'
# )
#
# battery = Battery.create!(
#  battery_capacity: '58 Вт*год',
#  battery_life: 7
# )
#
# connection = Connection.create!(
#  network_adapters: true,
#  ports: '1 x USB 3.2 Gen1 / 1 x USB 2.0 / 1 x USB 3.2 Type-C Gen1 / HDMI',
#  wireless_communication: 'Bluetooth 5.0 Wi-Fi 5'
# )
#
# corp = Corp.create!(
#  color: 'red',
#  weight: 2,
#  sound_system: 'sound_system',
#  manipulators: 'Touch',
#  dimensions: '359.2 x 236.5 x 19.9 мм',
#  body_material: 'Plastic'
# )
#
# datalogger = Datalogger.create!(
#  volume: 512,
#  type_datalogger: 'SSD'
# )
#
# processor = Processor.create!(
#  name: 'Hexanuclear AMD Ryzen 5 5500U (2.1 - 4.0 ГГц)',
#  operating_system: false,
#  clock_frequency: 4,
#  number_cores: 6
# )
#
# ram = Ram.create!(
#  amount: 16,
#  number_slot: 1,
#  type_ram: 'DDR4-3200 МГц'
# )
#
# screen = Screen.create!(
#  diagonal: '15.6" (1920x1080) Full HD',
#  screen_type: 'IPS',
#  resolution: 1920,
#  refresh_rate: 60,
#  built_camera: true
# )
#
# videocard = Videocard.create!(
#  type_videocard: 'Integrated video card',
#  name: 'Sapphire Radeon',
#  description: 'Екран 15.6" IPS (1920x1080) Full HD, матовий / AMD Ryzen 5 5500U (2.1 - 4.0 ГГц) / RAM 16 ГБ / SSD 512 ГБ / AMD Radeon Graphics / без ОД / Wi-Fi / Bluetooth / веб-камера / без ОС / 1.65 кг / сірий',
#  amount_memory: 16
# )
#
# AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?