#!/bin/bash
set -e


# Ensure PID is reset. This can happen if docker isn't cleanly shut down.
rm -rf /usr/src/app/tmp/pids

# Verify node_modules are up to date
npm install --quiet

# Verify gems are up to date
if ! bundle check > /dev/null; then
  echo "Gems dependencies are out of date. Installing..."
  bundle install
fi

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
