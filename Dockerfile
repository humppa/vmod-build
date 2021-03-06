FROM ubuntu:18.04

RUN set -x \
  && apt-get update \
  && apt-get install --yes --no-install-recommends \
    debhelper \
    devscripts \
    build-essential \
    fakeroot \
    pkg-config \
    python-docutils \
    varnish \
    libvarnishapi-dev

WORKDIR /usr/src/varnish-modules

COPY . .

RUN set -x \
  && debuild -b -uc -us \
  && ls -la /usr/src

ENTRYPOINT ["/bin/bash"]
