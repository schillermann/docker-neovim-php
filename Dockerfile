FROM debian:10.13

RUN apt-get update && apt-get install -y \
  git

WORKDIR /workspaces
RUN chmod 777 /workspaces
RUN useradd --home-dir /workspaces --shell /bin/bash dev
USER dev
