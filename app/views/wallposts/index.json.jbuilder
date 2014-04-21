json.array!(@wallposts) do |wallpost|
  json.extract! wallpost, :content, :user_id
  json.url wallpost_url(wallpost, format: :json)
end