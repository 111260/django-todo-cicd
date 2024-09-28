# Use a specific version of Python (3.8 is recommended for Django 3.2)
FROM python:3.8

# Set the working directory in the container
WORKDIR /data

# Install necessary system packages to ensure distutils is available
RUN apt-get update && apt-get install -y python3-distutils && apt-get clean

# Install Django
RUN pip install --no-cache-dir django==3.2

# Copy the current directory contents into the container at /data
COPY . .

# Run database migrations
RUN python manage.py migrate

# Expose the port the app runs on
EXPOSE 8000

# Command to run the application
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]


