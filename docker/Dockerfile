FROM python:3.8

ARG DEBIAN_FRONTEND=noninteractive

RUN mkdir -p ~/.ssh/ \
    && ssh-keyscan github.com >> ~/.ssh/known_hosts \
    && chmod 700 ~/.ssh \
    && chmod 644 ~/.ssh/known_hosts

RUN pip install dvc[s3]==2.10.0

WORKDIR /mnt/workspace
