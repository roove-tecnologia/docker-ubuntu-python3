FROM phusion/baseimage:latest

MAINTAINER Luis Siqueira, siqueira@roove.com.br

ENV DEBIAN_FRONTEND noninteractive
ENV LIBEV_FLAGS=4

RUN add-apt-repository ppa:deadsnakes/ppa -y
RUN apt-get upgrade -y
RUN apt-get update --fix-missing
RUN apt-get install -y python3.6
RUN rm /usr/bin/python3 && ln -s /usr/bin/python3.6 /usr/bin/python3

RUN apt-get install libssl1.0.0 --force-yes -y

## postgres dev symbols
RUN apt-get install -y libpq-dev
RUN apt-get install -y libffi-dev
RUN apt-get install -y libssl-dev

RUN apt-get install -y nginx

RUN apt-get install -y python3-setuptools
RUN apt-get install -y python3-pip
RUN pip3 install --upgrade pip

RUN apt-get install -y sqlite3
RUN apt-get install -y binutils
RUN apt-get install -y libproj-dev
RUN apt-get install -y gdal-bin

RUN apt-get install -y build-essential freeglut3 freeglut3-dev binutils-gold
RUN apt-get install -y "^libxcb.*" libx11-xcb-dev libglu1-mesa-dev libxrender-dev
RUN apt-get install -y libglfw3-dev libgles2-mesa-dev
