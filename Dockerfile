FROM ubuntu:latest

COPY getevo.py /scripts/getevo.py

RUN apt-get update
RUN apt-get install -y \
python2 \
curl \
cron \
nano

RUN curl https://bootstrap.pypa.io/get-pip.py --output get-pip.py
RUN python2 get-pip.py
RUN pip2 install evohomeclient
RUN pip2 install graphitesend
RUN touch /scripts/getevo.log
COPY crontab /etc/cron.d/getevo
RUN chmod 0644 /etc/cron.d/getevo
RUN service cron start


