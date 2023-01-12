#!/usr/bin/env ruby

bundle install
bundle exec rails db:create
bundle exec rails db:migrate