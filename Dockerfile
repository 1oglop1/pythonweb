# Creates the container image
# based on the python:3.7 image
FROM python:3.7

# Prepare development folder inside the container
RUN mkdir /src
WORKDIR /src
COPY src /src/

# Upgrade pip
RUN python -m pip install --upgrade pip

# Include python packages you require here
RUN pip install flask
RUN pip install ptvsd