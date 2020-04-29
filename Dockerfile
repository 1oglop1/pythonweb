# Creates the container image
# based on the python:3.7 image
FROM python:3.7

# Define environment variables
ENV PYTHONUNBUFFERED 1

# Prepare development folder inside the container
RUN mkdir /src
WORKDIR /src
COPY src /src/

# Include python packages you require here
RUN pip install flask
RUN pip install ptvsd
