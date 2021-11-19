ACTIONS_RUNNER_INPUT_NAME=$HOSTNAME
# get regsistration token for this runnner
ACTIONS_RUNNER_INPUT_TOKEN="$(curl -sS --request POST --url "https://api.github.com/repos/PoojaBeraClearstream/youtube-gcloud-continuous-deployment/actions/runners/registration-token" --header "authorization: Bearer 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"  --header 'content-type: application/json' | jq -r .token)"
# configure runner
export RUNNER_ALLOW_RUNASROOT=1
/runner/config.sh --unattended --replace --work "/tmp" --url "$ACTIONS_RUNNER_INPUT_URL" --token "$ACTIONS_RUNNER_INPUT_TOKEN" --labels k8s-runner
# start runner
# https://github.com/actions/runner/issues/246#issuecomment-615293718
/runner/bin/runsvc.sh