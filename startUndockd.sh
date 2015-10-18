#!/usr/bin/env bash

docker run --name Undockd-DB -d mongo --storageEngine wiredTiger
docker run -d -p 10.10.10.1:14080:80 -v /srv/files/private/elifax/Projects/Undockd:/application/undockd -v /var/run/docker.sock:/var/run/docker.sock --link Undockd-DB:mongo --name Undockd elifax/undockd
