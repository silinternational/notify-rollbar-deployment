#!/usr/bin/env ash

ENVIRONMENT="staging"
if [ "$CI_BRANCH" = "master" ]; then
    ENVIRONMENT="production"
fi

echo "Notifying Rollbar of deployment to $ENVIRONMENT ..."

curl https://api.rollbar.com/api/1/deploy/ \
  -F access_token=$ROLLBAR_TOKEN \
  -F environment=$ENVIRONMENT \
  -F revision=$CI_COMMIT_ID \
  -F local_username=$CI_COMMITTER_USERNAME