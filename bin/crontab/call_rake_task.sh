#!/bin/bash
ARG_RAILS_ENV=$1
ARG_RAKE_COMMAND=$2

if [ -z "$ARG_RAILS_ENV" ]; then
  echo "実行するRAILS_ENVを引数に与えてください"
  exit 1
fi

if [ "$ARG_RAILS_ENV" = "production" ]; then
  cd /var/www/hoiku-picks/current/
else
  BUNDLE=bundle
fi

RAILS_ENV=$ARG_RAILS_ENV $BUNDLE exec rake ${ARG_RAKE_COMMAND}
