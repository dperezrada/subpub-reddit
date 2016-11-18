## Execute one, create the topic and the  subscriptions
```
gcloud beta pubsub topics create fh-reddit-topic
gcloud beta pubsub subscriptions create fh-reddit-subscription --topic=fh-reddit-topic
```

## Send the messages
```
bundle exec ruby api-poller.rb |xargs -0 -I {} sh -c "gcloud beta pubsub topics publish fh-reddit-topic '{}'"
```

## Read the messages
```
gcloud beta pubsub subscriptions pull  fh-reddit-subscription --max-messages=10
```