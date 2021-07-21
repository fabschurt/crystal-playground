FROM crystallang/crystal:1.1.0-alpine

RUN \
  adduser -D -u 1000 -s /bin/false -g '' crystal && \
  mkdir /usr/run && \
  chown crystal /usr/run

WORKDIR /usr/run
USER crystal
