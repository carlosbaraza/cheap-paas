FROM jwilder/docker-gen:0.7.3

# From https://github.com/gliderlabs/docker-alpine/blob/master/docs/usage.md#example
RUN apk add --update \
    python \
    py-pip \
    curl \
  && pip install virtualenv \
  && pip install docker-cloud \
  && rm -rf /var/cache/apk/*

RUN mkdir -p /etc/docker-gen/templates

COPY entrypoint.sh /entrypoint.sh
RUN chmod u+x /entrypoint.sh

COPY restart_service.sh /restart_service.sh
RUN chmod u+x /restart_service.sh

ENTRYPOINT /entrypoint.sh
