from fastapi import FastAPI
import random

app = FastAPI()

@app.get("/health")
def health_check():
    # Randomly simulate an unhealthy state for testing
    if random.choice([True, False]):
        return {"status": "healthy"}
    else:
        raise Exception("Unhealthy!")
