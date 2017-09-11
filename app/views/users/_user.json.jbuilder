json.extract! user, :id, :name, :alias, :college, :is_active, :is_admin, :created_at, :updated_at
json.url user_url(user, format: :json)
