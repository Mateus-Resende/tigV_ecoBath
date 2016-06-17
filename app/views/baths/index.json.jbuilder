json.array!(@baths) do |bath|
  json.extract! bath, :id, :amount_spent, :date, :ideal_amount, :time_spent, :user_id
  json.url bath_url(bath, format: :json)
end
