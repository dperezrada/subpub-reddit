require "redd"
require 'json'

r = Redd.it(:script, "6tR9YMaHd16Y3w", "0-dEaZy2V9NAngbw5C2DgywOHYI", "raff_cl", "lala4life2$!", user_agent: "TestBot v1.0.0")
r.authorize!

# Streaming
def stream_all! r
  r.stream :get_comments, "all" do |comment|
    puts comment.body.gsub(/[\n\r'"]/, ' ') 
  end
end

stream_all!(r)