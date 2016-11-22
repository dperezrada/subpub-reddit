require "redd"
require "json"


user = nil
pass = nil
IO.foreach('credentials.txt') do |line|
  result = line.split(/:\s+/);
  user = result[1] if result[0] == "user"
  pass = result[1] if result[0] == "pass"
 end

r = Redd.it(:script, "6tR9YMaHd16Y3w", "0-dEaZy2V9NAngbw5C2DgywOHYI", user, pass, user_agent: "TestBot v1.0.0")
r.authorize!

# Streaming
def stream_all! r
  r.stream :get_comments, "all" do |comment|
    puts JSON.pretty_generate(comment)
    exit
  end
end

stream_all!(r)