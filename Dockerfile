FROM ubuntu

RUN apt-get update
RUN apt-get upgrade
RUN apt-get install -y python3
RUN apt-get install -y nasm
RUN apt-get install -y xorriso
RUN apt-get install -y grub-pc-bin
RUN apt-get install -y grub-common

ADD test.py /home/test.py

ENTRYPOINT [ "python3", "/home/test.py" ]
# ENTRYPOINT [ "apt", "list", "--installed" ]

VOLUME /root/env
WORKDIR /root/env