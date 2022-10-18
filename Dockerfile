FROM ubuntu:22.04 AS compiler-common
VOLUME openstreetmap-data
ENV DEBIAN_FRONTEND=noninteractive


# Get packages
RUN apt-get update \
&& apt-get install -y --no-install-recommends \
 apache2 \
 sudo \
 wget \
&& apt-get clean autoclean \
&& apt-get autoremove --yes \
&& rm -rf /var/lib/{apt,dpkg,cache,log}/


RUN wget https://download.geofabrik.de/africa/zambia-latest.osm.pbf --no-check-certificate
RUN -v /home/renderaccount/zambia-latest.osm.pbf:/data.osm.pbf -v openstreetmap-data:/var/lib/postgresql/12/main overv/openstreetmap-tile-server:1.3.10 import
RUN -p 80:80 -v openstreetmap-data:/var/lib/postgresql/12/main -d overv/openstreetmap-tile-server:1.3.10 run


EXPOSE 80 5432
