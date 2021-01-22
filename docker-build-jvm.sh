#!/bin/sh
docker build -f Dockerfile-jvm -t helloworld-graal-jvm .
echo
echo
echo "To run the docker container execute:"
echo "    $ docker run -p 8080:8080 helloworld-graal-jvm"
