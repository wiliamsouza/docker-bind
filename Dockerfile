# Bind container used for local development environment
#
# Version 0.0.1

FROM ubuntu:12.04

MAINTAINER Wiliam Souza <wiliamsouza83@gmail.com>

# Set language
ENV LANG en_US.UTF-8
ENV DEBIAN_FRONTEND=noninteractive

# Add universe 
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list

RUN dpkg-divert --local --rename --add /sbin/initctl
RUN ln -s /bin/true /sbin/initctl

RUN locale-gen en_US en_US.UTF-8
RUN dpkg-reconfigure locales

# Upgrade
RUN apt-get update
RUN apt-get upgrade -y

# Install
RUN apt-get install bind9 supervisor -y

# Configuration
ADD db.localdev /etc/bind/db.localdev
ADD named.conf.local /etc/bind/named.conf.local
ADD named.conf.options /etc/bind/named.conf.options

ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

EXPOSE 53

CMD ["/usr/bin/supervisord"]
