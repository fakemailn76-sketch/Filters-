FROM python:3.11-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

VOLUME ["/data"]
ENV BOT_DATA_DIR=/data

CMD ["sh", "-c", "gunicorn main:app --bind 0.0.0.0:$PORT"]
