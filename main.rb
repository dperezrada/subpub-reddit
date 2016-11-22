require "google/cloud/pubsub"

pubsub = Google::Cloud::Pubsub.new(
  project: "fh-hackathon", 
  keyfile: "fh-hackathon-secret.json"
  )



# Retrieve a topic
topic = pubsub.topic "fh-reddit-topic"

# Publish a new message
msg = topic.publish "new-message"
