FROM ubuntu:22.04 AS compiler-common
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


RUN wget https://download.geofabrik.de/africa/zambia-latest.osm.pbf
RUN docker volume create openstreetmap-data

EXPOSE 80 5432
