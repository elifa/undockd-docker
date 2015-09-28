#!/usr/bin/env bash

docker run -d --name=undockd-db --volumes-from=undockd-data -e POSTGRES_USER=undockd -e POSTGRES_PASSWORD=undockd
docker run -d -p 10.10.10.1:14080:80 -v /srv/files/private/elifax/Projects/Undockd:/application/undockd --link undockd-db:postgres --name=undockd elifax/undockd
