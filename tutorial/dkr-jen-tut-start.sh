#!/bin/bash
DOCKER_IMG=myjenkins:1.0

docker run --rm --name jen-tut -u root -v /var/run/docker.sock:/var/run/docker.sock -p 8080:8080 ${DOCKER_IMG}
