# Bind container used for local development environment
#
# Version 0.1.0

FROM ubuntu:12.04

MAINTAINER Wiliam Souza <wiliamsouza83@gmail.com>

# Base
ENV LANG en_US.UTF-8
ENV DEBIAN_FRONTEND noninteractive

RUN echo "deb http://archive.ubuntu.com/ubuntu precise main restricted universe multiverse" > /etc/apt/sources.list

RUN locale-gen en_US en_US.UTF-8
RUN dpkg-reconfigure locales

RUN apt-get install -y python-software-properties

RUN dpkg-divert --local --rename --add /sbin/initctl

# Environment

# sources

# ppas

# upgrade
RUN apt-get update

# bind
RUN apt-get install bind9 -y

ADD db.localdev /etc/bind/db.localdev
ADD named.conf.local /etc/bind/named.conf.local
ADD named.conf.options /etc/bind/named.conf.options

# start script

# supervisor
RUN apt-get install supervisor -y
RUN update-rc.d -f supervisor disable

ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

EXPOSE 53

CMD ["/usr/bin/supervisord"]
