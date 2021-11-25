#!/bin/sh
registration_url="https://api.github.com/repos/PoojaBeraClearstream/youtube-gcloud-continuous-deployment/actions/runners/registration-token"
echo "Requesting registration URL at '${registration_url}'"

payload=$(curl -sX POST -H "Authorization: token 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" ${registration_url})
export RUNNER_TOKEN=$(echo $payload | jq .token --raw-output)
export RUNNER_ALLOW_RUNASROOT=1
./config.sh \
    --name $(hostname) \
    --token "AVCJM2BIEGL7NWT2PZ75NVDBT6IUK"   \
    --url https://github.com/PoojaBeraClearstream/youtube-gcloud-continuous-deployment \
    --work runner \
    --unattended \
    --replace

./run.sh --once