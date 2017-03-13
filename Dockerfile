FROM python:alpine

ENV JOBS=100 \
    SITE=https://m.vk.com

RUN apk add --update \
      gcc \
      musl-dev \
      git \
      bash \
      curl \
      parallel \
    && pip install \
         aiohttp \
         aiodns \
         maxminddb \
    && pip install -U git+https://github.com/constverum/ProxyBroker.git

COPY proxy_check.sh docker-entrypoint.sh /usr/local/bin/

VOLUME /opt

WORKDIR /opt

ENTRYPOINT ["docker-entrypoint.sh"]
