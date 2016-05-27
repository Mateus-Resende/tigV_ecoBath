json.array!(@users) do |user|
  json.extract! user, :id, :first_name, :email, :last_name, :birthdate, :gender, :password_digest
  json.url user_url(user, format: :json)
end
