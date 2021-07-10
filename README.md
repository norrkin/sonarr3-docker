[![sonarr-pipeline](https://github.com/norrkin/sonarr3-docker/actions/workflows/docker-image.yml/badge.svg)](https://github.com/norrkin/sonarr3-docker/actions/workflows/docker-image.yml)

## Sonarr

A docker container for [Sonarr](https://github.com/Sonarr/Sonarr)

### Usage

Commands to build & deploy [Sonarr](https://sonarr.tv) container using Docker.

*Build locally;*

Clone repository and run the following commands;

    $ sudo docker build -t sonarr .

*Run container;*

\*Following command sets max memory and links to an existing SABnzbd instance.

    $ sudo docker run -tid -m 256m --name sonarr --link sabnzbd:sabnzbd -p 8989:8989 -v /path/on/host/config:/config -v /path/on/host/download:/download -e UID=1030 -e GID=100 sonarr

*Attach to container;*

    $ sudo docker exec -it sonarr /bin/sh