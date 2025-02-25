# Stage 1: Builder
FROM python:3.11-slim AS builder
WORKDIR /install

RUN apt-get update && apt-get install -y --no-install-recommends gcc libpq-dev && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .
RUN pip install --upgrade pip && pip install --prefix=/install -r requirements.txt

# Stage 2: Final Image
FROM python:3.11-slim
WORKDIR /app

COPY --from=builder /install /usr/local

COPY . .

RUN adduser --disabled-password --gecos "" appuser
USER appuser

EXPOSE 5000

ENV FLASK_ENV=production

CMD ["gunicorn", "app:app", "--bind", "0.0.0.0:5000", "--timeout", "120"]

