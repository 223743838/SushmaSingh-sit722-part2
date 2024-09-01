# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY ./book_catalog /app

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Make port 8000 available to the world outside this container
EXPOSE 8000

# Define environment variable with the provided database URL
ENV DATABASE_URL postgresql://part_2db_user:i6treB57MTXsjHqoWZyiWQu9B1xQYerk@dpg-cr9c4brv2p9s73b57ih0-a.oregon-postgres.render.com/part_2db

# Run app.py when the container launches
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]