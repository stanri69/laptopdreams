json.extract! connection, :id, :network_adapters, :ports, :wireless_communication, :created_at, :updated_at
json.url connection_url(connection, format: :json)
