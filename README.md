
# vmod-build

[releases]: https://download.varnish-software.com/varnish-modules

Debian packaging for Varnish modules. (Currently only for Ubuntu 18.04.)

## Prerequisites

* Docker

## Usage

1. Clone this repository.

2. Download a release of [varnish-modules][releases] and extract it on top of
   the clone:

        $ tar xzvf varnish-modules-0.15.0.tar.gz -C vmod-build --strip-components=1

3. Build docker image and Debian package:

        $ cd vmod-build
        $ docker build --pull -t vmods .

4. Get the package from the docker image:

        $ docker create --name vmods vmods
        $ docker cp vmods:/usr/src/varnish-modules_0.15.0-1_amd64.changes .
        $ docker rm vmods
