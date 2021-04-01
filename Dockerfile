# Base image to be used
FROM mono:latest

# Tweaked by me
LABEL maintainer "mark <norrkin@icloud.com>"

# Define what release we want to use
ENV SONARR_VERSION 3.0.6.1196

RUN apt-get update && apt-get install -y --no-install-recommends curl libmediainfo0v5 && \
    mkdir -p /sonarr && \
    echo "Downloading version $SONARR_VERSION" && \
    curl -kL "https://download.sonarr.tv/v3/main/${SONARR_VERSION}/Sonarr.main.${SONARR_VERSION}.linux.tar.gz" \
    | tar -xz -C /sonarr --strip-components=1 && \
    apt-get autoremove -y curl && apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Mount volumes
VOLUME ["/config", "/download", "/torrents"]

# Set working directory
WORKDIR /sonarr

# Open sonarr port
EXPOSE 8989

# set user
USER ${UID}:${GID}

# Start sonarr
CMD ["mono", "--debug", "/sonarr/Sonarr.exe", "-nobrowser", "-data=/config"]