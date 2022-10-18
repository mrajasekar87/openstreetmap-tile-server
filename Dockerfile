FROM ubuntu:22.04 AS compiler-common
ENV DEBIAN_FRONTEND=noninteractive
RUN wget https://download.geofabrik.de/africa/zambia-latest.osm.pbf
RUN docker volume create openstreetmap-data

EXPOSE 80 5432
