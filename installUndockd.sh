#!/usr/bin/env bash

docker create -v /var/lib/postgresql/data --name=undpostgress /bin/true
