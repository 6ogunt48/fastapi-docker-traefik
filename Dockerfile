# Docker file


# pull the official docker image
FROM python:3.11.6-slim-bullseye

# set work directory
WORKDIR /app

# set env variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONBUFFERED 1

# install system dependencies
# Install system and project dependencies
RUN apt-get update && apt-get -y install netcat gcc postgresql libpq-dev && apt-get clean && pip install --upgrade pip && \
    pip install poetry && poetry config virtualenvs.create false

COPY ./pyproject.toml ./poetry.lock ./
RUN poetry install

# copy project
COPY . .

