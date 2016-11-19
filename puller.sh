#!/bin/bash
while [[ true ]]; do
	gcloud beta pubsub subscriptions pull  fh-reddit-subscription --max-messages=100 --auto-ack
	sleep 1
done