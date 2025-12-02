FROM ubuntu

RUN apt-get update
RUN apt-get upgrade
RUN apt-get install -y python3

ADD test.py /home/test.py

ENTRYPOINT [ "python3", "/home/test.py" ]
# ENTRYPOINT [ "apt", "list", "--installed" ]