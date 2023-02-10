json.extract! videocard, :id, :type_videocard, :name, :description, :amount_memory, :created_at, :updated_at
json.url videocard_url(videocard, format: :json)
