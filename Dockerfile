# Use the official Python image
FROM python:3.9-slim-bookworm

# Install ffmpeg
RUN apt-get update && apt-get install -y ffmpeg && apt-get clean

# Set the working directory in the container
WORKDIR /app

# Copy the dependencies file
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code
COPY . .

# Run the bot
CMD ["python", "bot.py"]
