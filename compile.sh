#!/usr/bin/env bash

ARTIFACT=micronaut-graalvm-helloworld
MAINCLASS=com.example.Application
VERSION=0.1

GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

rm -rf target
mkdir -p target/native-image

echo "Packaging $ARTIFACT with Maven"
mvn -ntp package -DskipTests > target/native-image/output.txt

GRAALVM_VERSION=`native-image --version`
echo "Compiling $ARTIFACT with $GRAALVM_VERSION"

native-image --no-server --no-fallback -H:Class=com.example.Application -cp target/micronaut-graalvm-helloworld-*.jar

if [[ -f target/$ARTIFACT ]]
then
  printf "${GREEN}SUCCESS${NC}\n"
  rm ./$ARTIFACT-$VERSION
  exit 0
else
  cat target/native-image/output.txt
  printf "${RED}FAILURE${NC}: an error occurred when compiling the native-image.\n"
  exit 1
fi