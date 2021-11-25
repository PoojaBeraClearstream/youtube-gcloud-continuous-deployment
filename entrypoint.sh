#!/bin/bash

ACTIONS_RUNNER_INPUT_NAME=$HOSTNAME
# get regsistration token for this runnner
ACTIONS_RUNNER_INPUT_TOKEN="$(curl -sS --request POST --url "https://github.com/PoojaBeraClearstream/youtube-gcloud-continuous-deployment" --header "authorization: Bearer AVCJM2BDN4N5WCYPGUY3IDLBT5Y2K"  --header 'content-type: application/json' | jq -r .token)"
# configure runner
export RUNNER_ALLOW_RUNASROOT=1
/runner/config.sh --unattended --replace --work "/tmp" --url "$ACTIONS_RUNNER_INPUT_URL" --token "$ACTIONS_RUNNER_INPUT_TOKEN" --labels runner
# start runner
# https://github.com/actions/runner/issues/246#issuecomment-615293718
/runner/bin/runsvc.sh