#!/bin/sh

registration_url="https://api.github.com/repos/PoojaBeraClearstream/youtube-gcloud-continuous-deployment/actions/runners/registration-token"
echo "Requesting registration URL at '${registration_url}'"

payload=$(curl -sX POST -H "Authorization: token ${GIT_TOKEN}" ${registration_url})
export RUNNER_TOKEN=$(echo $payload | jq .token --raw-output)
export RUNNER_ALLOW_RUNASROOT=1
./config.sh \
    --name $(hostname) \
    --token ${GIT_TOKEN}   \
    --url https://github.com/PoojaBeraClearstream/youtube-gcloud-continuous-deployment \
    --work runner \
    --unattended \
    --replace

./run.sh --once 