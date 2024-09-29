FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
    python3.12 \
    python3-pip \
    git

RUN apt install python3.12-venv

RUN python3 -m venv /usr

ENV PATH="/usr/bin:$PATH"

RUN pip install PyYAML

COPY feed.py /usr/bin/feed.py

COPY entrypoint.sh \entrypoint.sh

ENTRYPOINT [ "entrypoint.sh" ]
