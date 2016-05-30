#!/bin/bash
set -e

GULP_ARGS=""

if [ -f .git ]; then
  mv .git .git.bak
fi

npm install &&
bower install

if [ -f .git.bak ]; then
  mv .git.bak .git
fi

usage() {
  echo "specify environment production or development" >&2
}

if [ $1 = "production" ]; then
  gulp $GULP_ARGS build
  nginx -g "daemon off;"
elif [ $1 = "development" ]; then
  gulp $GULP_ARGS serve
else
  usage
  exit 1
fi
