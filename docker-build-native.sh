#!/usr/bin/env bash

./mvnw package -DskipTests

docker build -f Dockerfile.native -t micronaut-graalvm-helloworld:graalvm .