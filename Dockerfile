# Use official Python image
FROM python:3.9-slim-bookworm

# Install ffmpeg (lighter install)
RUN apt-get update && apt-get install -y --no-install-recommends ffmpeg \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy requirements
COPY requirements.txt .

# Upgrade pip and install dependencies
RUN pip install --upgrade pip \
    && pip install --no-cache-dir -r requirements.txt

# Copy project files
COPY . .

# Run bot
CMD ["python", "bot.py"]
