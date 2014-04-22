docker-bind
-----------

Docker bind container template used to create development environment.

To build run:

```
$ docker.io build -t wiliamsouza/bind .
```

Change `wiliamsouza` to your Docker
[index](https://index.docker.io/u/wiliamsouza/) username.

Shell access:

```
$ docker.io run -i -t wiliamsouza/bind /bin/bash
```

Usage:

```
$ docker.io run -p <ip-address>:53:53 -p <ip-address>:53:53/udp -d -t wiliamsouza/bind
```
