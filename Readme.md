gcloud beta pubsub topics create fh-reddit-topic
gcloud beta pubsub subscriptions create fh-reddit-subscription --topic=fh-reddit-topic

bundle exec ruby api-poller.rb |xargs -0 -I {} sh -c "gcloud beta pubsub topics publish fh-reddit-topic '{}'"
