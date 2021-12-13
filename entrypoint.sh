#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f /myapp/tmp/pids/server.pid

# If the database exists, migrate. Otherwise setup (create and migrate)
# bundle exec rake db:drop db:create db:migrate db:seed 2>/dev/null || bundle exec rake db:drop db:create db:migrate db:seed

bundle exec rake db:migrate db:seed 2>/dev/null || bundle exec rake db:create db:migrate db:seed
echo "Database created and migrated successfully"
exec "$@"


# Then exec the container's main process (what's set as CMD in the Dockerfile).