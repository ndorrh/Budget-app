#!/usr/bin/env bash
# exit on error
set -o errexit

bundle install
RAILS_ENV=production rails assets:precompile
rails assets:clean
rails db:migrate