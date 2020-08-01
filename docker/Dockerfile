############################################################
# Dockerfile that contains SteamCMD
############################################################
FROM debian:buster-slim
MAINTAINER wdw87 <github.com/wdw87>
LABEL maintainer="wdw694439986@gmail.com"
ARG PUID=1000
COPY ./sources.list /etc/apt/sources.list
ENV STEAMCMDDIR /home/steam/steamcmd

# Install, update & upgrade packages
# Create user for the server
# This also creates the home directory we later need
# Clean TMP, apt-get cache and other stuff to make the image smaller
# Create Directory for SteamCMD
# Download SteamCMD
# Extract and delete archive
RUN set -x \
    && dpkg --add-architecture i386 \
	&& apt-get update \
	&& apt-get install -y --no-install-recommends --no-install-suggests \
		lib32stdc++6=8.3.0-6 \
		lib32gcc1=1:8.3.0-6 \
        libcurl4-gnutls-dev:i386 \
		wget=1.20.1-1.1 \
		ca-certificates=20190110 \
		nano=3.2-3 \
	&& useradd -u $PUID -m steam \
        && su steam -c \
                "mkdir -p ${STEAMCMDDIR} \
                && wget -qO- 'https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz' | tar xvzf - -C ${STEAMCMDDIR} \
                && ./${STEAMCMDDIR}/steamcmd.sh \
                    +login anonymous \
                    +force_install_dir /home/steam/dst/ \
                    +app_update 343050  validate \
                    +quit \
                && mkdir /home/steam/.steam/sdk32 \
                && ln -s /home/steam/steamcmd/linux32/steamclient.so /home/steam/.steam/sdk32/steamclient.so" \
	&& apt-get remove --purge -y \
		wget \
	&& apt-get clean autoclean \
	&& apt-get autoremove -y \
	&& rm -rf /var/lib/apt/lists/*

# Switch to user steam
USER steam

RUN ln -s /home/steam/steamcmd/linux32/libstdc++.so.6 /home/steam/dst/bin/lib32/ && \
    cd /home/steam/dst/bin/ && \
    echo "/home/steam/steamcmd/steamcmd.sh +@ShutdownOnFailedCommand 1 +@NoPromptForPassword 1 +login anonymous +force_install_dir /root/DST +app_update 343050 +quit" > start.sh && \
    echo "/home/steam/dst/bin/dontstarve_dedicated_server_nullrenderer -only_update_server_mods" >> start.sh && \
    echo "/home/steam/dst/bin/dontstarve_dedicated_server_nullrenderer -shard \"\$SHARD_NAME\"" >> start.sh && \
    chmod +x start.sh
VOLUME /home/steam/.klei/DoNotStarveTogether/Cluster_1
VOLUME /home/steam/dst/mods
EXPOSE 10999/udp
EXPOSE 10998/udp
WORKDIR /home/steam/dst/bin
CMD "/home/steam/dst/bin/start.sh"
