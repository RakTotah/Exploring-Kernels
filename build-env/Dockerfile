FROM ubuntu

RUN apt-get update
RUN apt-get upgrade
RUN apt-get install -y python3
RUN apt-get install -y nasm
RUN apt-get install -y xorriso
RUN apt-get install -y grub-common
RUN apt-get install -y build-essential

VOLUME /root/env
WORKDIR /root/env