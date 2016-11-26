require "redd"
require "json"


user = nil
pass = nil
secret = nil
appId = nil
IO.foreach('credentials.txt') do |line|
  result = line.split(/:\s+/);
  user = result[1] if result[0] == "user"
  pass = result[1] if result[0] == "pass"
  secret = result[1] if result[0] == "secret"
  appId = result[1] if result[0] == "appId"
 end

r = Redd.it(:script, secret, appId, user, pass, user_agent: "TestBot v1.0.0")
r.authorize!

# Streaming
def stream_all! r
  r.stream :get_comments, "all" do |comment|
    puts JSON.pretty_generate(comment)
    exit
  end
end

stream_all!(r)