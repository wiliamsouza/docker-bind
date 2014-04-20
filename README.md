docker-dns
----------

Docker dns container template used to create development environment.

To build run:

```
$ docker.io build -t wiliamsouza/dns .
```

Change `wiliamsouza` to your Docker
[index](https://index.docker.io/u/wiliamsouza/) username.

Shell access:

```
$ docker.io run -i -t wiliamsouza/dns /bin/bash
```

Usage:

```
$ docker.io run -p <ip-address>:53:53 -p <ip-address>:53:53/udp -d wiliamsouza/dns
```
