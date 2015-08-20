json.array!(@users) do |user|
  json.extract! user, :id, :user_first_name, :user_last_name, :user_email, :user_nnumber
  json.url user_url(user, format: :json)
end
