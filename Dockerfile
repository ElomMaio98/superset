FROM python:3.11-slim

WORKDIR /app

RUN apt-get update && apt-get install -y \
    gcc \
    g++ \
    build-essential \
    postgresql-client \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY superset_config.py .
COPY entrypoint.sh .
RUN chmod +x entrypoint.sh

COPY . .

EXPOSE 8088

CMD ["./entrypoint.sh"]