FROM debian
ARG CLOUDFLARED_VERSION=2019.6.0

RUN apt-get update

WORKDIR /tmp
RUN apt-get install -y curl
RUN curl -LO https://github.com/cloudflare/cloudflared/archive/${CLOUDFLARED_VERSION}.tar.gz \
  && tar zxvf ./${CLOUDFLARED_VERSION}.tar.gz -C /usr/local/bin \
  && cloudflared --version
 
