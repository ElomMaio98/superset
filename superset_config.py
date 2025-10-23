import os

# Flask app configuration
SECRET_KEY = os.environ.get('SUPERSET_SECRET_KEY', 'dev-secret-key-change-in-production')

# Database configuration
SQLALCHEMY_DATABASE_URI = os.environ.get('SUPERSET_SQLALCHEMY_DATABASE_URI')

# Redis configuration (optional but recommended)
REDIS_HOST = os.environ.get('REDIS_HOST', 'localhost')
REDIS_PORT = int(os.environ.get('REDIS_PORT', 6379))
REDIS_DB = int(os.environ.get('REDIS_DB', 0))

# Security
WTF_CSRF_ENABLED = True
WTF_CSRF_CHECK_DEFAULT = False

# Features
ENABLE_PROXY_FIX = True