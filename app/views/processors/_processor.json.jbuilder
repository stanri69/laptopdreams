json.extract! processor, :id, :name, :operating_system, :clock_frequency, :number_cores, :created_at, :updated_at
json.url processor_url(processor, format: :json)
