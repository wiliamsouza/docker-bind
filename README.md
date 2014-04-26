docker-bind
------------

Docker bind server generic image source. This is based on `ubuntu:12.04` image.

Image
-----

You can `pull` a ready to use image from Docker
[index](https://index.docker.io/u/wiliamsouza/) running:

```
$ docker.io pull wiliamsouza/bind
```

Or build this repository:

```
$ git clone https://github.com/wiliamsouza/docker-bind.git
$ cd docker-bind/
$ docker.io build -t wiliamsouza/bind .
```

Change `wiliamsouza/bind` to your Docker index username.

Container
---------

This image uses volumes and environment variables to control the bind server
configuration.

Volumes:

* `/etc/bind`: Change server configurations using it.

You pass with `-v` docker option. Don't forget to use absolute path here.

Shell access:

```
$ docker.io run -p <ip-address>:53:53 -p <ip-address>:53:53/udp -i \
-v `pwd`/volumes/etc:/etc/bind \
-t wiliamsouza/bind /bin/bash
```

The command above will start a container give you a shell. Don't
forget to start the service running the `startup &` script.

Usage:

```
$ docker.io run --name bind -p <ip-address>:53:53 -p <ip-address>:53:53/udp -d \
-v `pwd`/volumes/etc:/etc/bind \
-t wiliamsouza/bind
```

The command above will start a container and return its ID.
