#!/bin/sh

registration_url="https://api.github.com/repos/PoojaBeraClearstream/youtube-gcloud-continuous-deployment/actions/runners/registration-token"
echo "Requesting registration URL at '${registration_url}'"

payload=$(curl -sX POST -H "Authorization: Bearer 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" ${registration_url})
export RUNNER_TOKEN=$(echo $payload | jq -r .token --raw-output)
export RUNNER_ALLOW_RUNASROOT=1
./config.sh \
    --name $(hostname) \
    --token "AVCJM2AA7B7SYVDNTBGLGEDBXHC7C"   \
    --url https://github.com/PoojaBeraClearstream/youtube-gcloud-continuous-deployment \
    --work runner \
    --unattended \
    --replace

./run.sh --once  
