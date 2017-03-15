FROM python:alpine

ENV JOBS=100 \
    SITE=https://m.vk.com

ADD https://github.com/D1abloRUS/go-proxycheck/releases/download/v0.1/go-proxycheck /usr/local/bin/go-proxycheck
COPY docker-entrypoint.sh /usr/local/bin/

RUN apk --no-cache add --update \
      gcc \
      musl-dev \
      git \
      ca-certificates \
    && chmod +x /usr/local/bin/go-proxycheck \
    && pip install \
         aiohttp \
         aiodns \
         maxminddb \
    && pip install -U git+https://github.com/constverum/ProxyBroker.git \
    && rm -rf /root/..?* /root/.[!.]* /root/* /tmp/*

VOLUME /opt

WORKDIR /opt

ENTRYPOINT ["docker-entrypoint.sh"]
