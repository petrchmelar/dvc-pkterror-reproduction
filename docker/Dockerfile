# fails with python 3.8 also
FROM python:3.10

ARG DEBIAN_FRONTEND=noninteractive

RUN mkdir -p ~/.ssh/ \
    && ssh-keyscan github.com >> ~/.ssh/known_hosts \
    && chmod 700 ~/.ssh \
    && chmod 644 ~/.ssh/known_hosts

# passes with dvc==2.9.5
RUN pip install dvc==2.10.0

WORKDIR /mnt/workspace
