FROM python:3.9-slim

WORKDIR /app
COPY app.py /app

RUN pip install fastapi uvicorn

# Health check added
HEALTHCHECK --interval=5s --timeout=3s --start-period=10s --retries=3 CMD curl -f http://localhost:8000/health || exit 1

CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000"]
