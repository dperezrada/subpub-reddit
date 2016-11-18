require "redd"

r = Redd.it(:script, "6tR9YMaHd16Y3w", "0-dEaZy2V9NAngbw5C2DgywOHYI", "USER", "PASSWORD", user_agent: "TestBot v1.0.0")
r.authorize!

# Streaming
def stream_all! r
  r.stream :get_comments, "all" do |comment|
    r.refresh_access! if r.access.expired? # for :web
    puts comment.body
  end
end

stream_all!(r)