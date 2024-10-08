FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
    python3.12 \
    python3-pip \
    git

RUN apt install -y python3.12-venv

RUN python3 -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"
RUN pip install PyYAML

COPY feed.py /usr/local/bin/feed.py

COPY entrypoint.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
