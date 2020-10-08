FROM ubuntu:18.04
ENV DEBIAN_FRONTEND noninteractive
MAINTAINER BensonLin

RUN echo "#!/bin/sh\nexit 0" > /usr/sbin/policy-rc.d
ENV KAFKA_HEAP_OPTS="-Xmx256M -Xms128M"

# setup
RUN apt-get update
RUN apt-get install -y g++ software-properties-common language-pack-en unzip curl wget vim libpam0g-dev libssl-dev cmake cron

# copy file to temp
COPY ./ /temp

# install kafka, nginx, php
WORKDIR /temp/install
RUN ./install.sh

WORKDIR /temp
ENTRYPOINT /temp/install/launch_nginx.sh && /temp/install/launch_kafka.sh && /temp/install/launch_consumer.sh && /bin/bash
