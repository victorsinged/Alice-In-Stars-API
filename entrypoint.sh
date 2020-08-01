#!/bin/bash -i

# Checks if the dependencies listed in Gemfile are satisfied by currently installed gems
bundle clean --force

# Remove a potentially pre-existing server.pid for Rails.
rm -rf /app/tmp/pids/server.pid

# Check whether or not gems are installed, and install it case not installed.
bundle check || bundle install --jobs=$(nproc) --retry=5

./app/libs/scripts/wait-for-it.sh postgres_alice_in_stars_api:5432 -- "$@"
