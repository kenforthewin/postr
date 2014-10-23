json.array!(@yaks) do |yak|
  json.extract! yak, :id, :score, :body
  json.url yak_url(yak, format: :json)
end
