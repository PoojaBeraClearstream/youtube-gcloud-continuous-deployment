#!/bin/bash

# Generate
CONFIG_TOKEN=$(curl --data "" --header "Authorization: Bearer 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" https://api.github.com/repos/PoojaBeraClearstream/youtube-gcloud-continuous-deployment/actions/runners/registration-token | jq -r '.token')

# Create the runner and configure it
./config.sh --url https://github.com/PoojaBeraClearstream/youtube-gcloud-continuous-deployment --token $CONFIG_TOKEN --unattended --replace

# Run it
./bin/runsvc.sh