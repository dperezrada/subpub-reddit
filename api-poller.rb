w = Redd.it(:web, "USER_ID", "0-dEaZy2V9NAngbw5C2DgywOHYI", "http://localhost.3000", user_agent: "TestSite v1.0.0")
url = w.auth_url("random_state", ["identity", "read"], :temporary)
puts "Please go to #{url} and enter the code below:"
code = gets.chomp
w.authorize!(code)

stream_all!

# Streaming
def stream_all!
  r.stream :get_comments, "all" do |comment|
    reddit.refresh_access! if reddit.access.expired? # for :web
    puts comment.body
  end
end