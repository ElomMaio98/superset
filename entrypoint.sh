#!/bin/bash
set -e

export FLASK_APP=superset.app:create_app
export FLASK_ENV=production

echo "Initializing Superset database..."
superset db upgrade --sql || true

echo "Creating admin user..."
superset fab create-admin \
  --username admin \
  --firstname Admin \
  --lastname User \
  --email admin@superset.local \
  --password admin123 || true

echo "Loading examples..."
superset load_examples || true

echo "Starting Superset..."
gunicorn \
  --bind 0.0.0.0:8088 \
  --workers 4 \
  --worker-class sync \
  --timeout 120 \
  --access-logfile - \
  --error-logfile - \
  'superset.app:create_app()'