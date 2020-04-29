# Creates the container image
# based on the python:3.7 image

FROM python:3.7
ENV PYTHONUNBUFFERED 1
RUN mkdir /src
WORKDIR /src
RUN pip install flask
RUN pip install ptvsd
COPY src /src/