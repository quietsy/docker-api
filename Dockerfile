FROM ghcr.io/linuxserver/baseimage-alpine:edge AS buildstage

ARG BUILD_DATE
ARG VERSION
LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="Quietsy"

COPY root/app/requirements.txt /tmp/requirements.txt

RUN \
  echo "**** install packages ****" && \
  apk add  -U --update --no-cache \
    python3 && \
  cd /app && \
  python3 -m venv /lsiopy && \
  pip install -U --no-cache-dir \
    pip && \
  pip install -U --no-cache-dir -r /tmp/requirements.txt && \
  rm -rf \
    /tmp/* \
    $HOME/.cache

COPY root/ /

EXPOSE 5000
VOLUME /config
