FROM ubuntu:16.04

MAINTAINER Luis Siqueira, siqueira@roove.com.br

ENV DEBIAN_FRONTEND noninteractive
ENV LIBEV_FLAGS=4

run apt-get upgrade -y
run apt-get update --fix-missing
run apt-get install python3 -y
run apt-get install libssl1.0.0 --force-yes -y

## postgres dev symbols
RUN apt-get install -y libpq-dev
RUN apt-get install -y libffi-dev
RUN apt-get install -y libssl-dev

# install nginx
RUN \
  apt-get install -y nginx && \
  echo "\ndaemon off;" >> /etc/nginx/nginx.conf

# install supervisor via apt-get because pip cannot work
RUN apt-get install -y supervisor
RUN apt-get install python3-setuptools -y

RUN apt-get -y install python3-pip

RUN pip3 install --upgrade pip

RUN pip3 install supervisor-stdout
