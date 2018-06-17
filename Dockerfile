FROM ubuntu:18.04

RUN set -x \
  && apt-get update \
  && apt-get install --yes --no-install-recommends \
    debhelper \
    devscripts \
    build-essential \
    pkg-config \
    python-docutils \
    varnish \
    libvarnishapi-dev

WORKDIR /usr/src/varnish-modules

COPY . .

RUN set -x \
  && debuild -b -uc -us \
  && mkdir -v /pkg \
  && cp -vx ../varnish-modules_* /pkg

ENTRYPOINT ["/bin/bash"]
