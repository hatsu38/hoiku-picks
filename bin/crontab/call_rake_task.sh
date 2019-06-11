#!/bin/bash
ARG_RAKE_COMMAND=$1

$HOME/.rbenv/bin/rbenv exec bundle exec rake ${ARG_RAKE_COMMAND}
