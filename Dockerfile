FROM python:alpine

ENV JOBS=100

COPY docker-entrypoint.sh /usr/local/bin/

RUN apk --no-cache add --update \
      gcc \
      musl-dev \
      git \
      ca-certificates \
      openssl \
    && pip install \
         aiohttp \
         aiodns \
         maxminddb \
    && pip install -U git+https://github.com/constverum/ProxyBroker.git \
    && rm -rf /root/..?* /root/.[!.]* /root/* /tmp/*

VOLUME /opt

WORKDIR /opt

ENTRYPOINT ["docker-entrypoint.sh"]
