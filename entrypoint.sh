#!/bin/bash

echo "Starting Superset with gunicorn..."
gunicorn \
  --bind 0.0.0.0:8088 \
  --workers 2 \
  --worker-class gevent \
  --timeout 120 \
  --access-logfile - \
  --error-logfile - \
  'superset.app:create_app()'