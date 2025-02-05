# Use an official Python runtime as a parent image
FROM python:3.12.0-slim-bookworm

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages specified in requirements.txt
RUN pip install --trusted-host pypi.python.org -r requirements.txt

# Make port 8000 available to the world outside this container
EXPOSE 8000

# Define environment variable
ENV MY_SECRET_KEY=qsdqzefqzsdfqfvrgerfefefsffd
ENV ALLOWED_HOSTS=*
ENV CSRF_TRUSTED_ORIGINS=*
# Run app.py when the container launches
CMD ["python", "manage.py", "runserver", "0.0.0.0:80"]