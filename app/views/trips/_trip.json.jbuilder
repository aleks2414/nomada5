json.extract! trip, :id, :name, :description, :nomad_id, :created_at, :updated_at
json.url trip_url(trip, format: :json)
