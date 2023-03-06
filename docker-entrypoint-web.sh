#!/bin/bash
set -e

# Wait for postgres container to be ready
until psql -h db -U postgres -c '\q'; do
  >&2 echo "Postgres is unavailable - sleeping"
  sleep 1
done

>&2 echo "Postgres is up - continuing"

# Run database migrations
bin/rails db:create db:migrate

# Start the Rails server
exec "$@"
