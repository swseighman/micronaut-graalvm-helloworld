# For JDK 11
FROM oracle/graalvm-ce:20.3.0-java11 as graalvm
RUN gu install native-image

COPY . /home/app/micronaut-graalvm-helloworld
WORKDIR /home/app/micronaut-graalvm-helloworld

RUN native-image --no-server -cp target/micronaut-graalvm-helloworld-0.1.jar

FROM frolvlad/alpine-glibc
RUN apk update && apk add libstdc++

EXPOSE 8080
COPY --from=graalvm /home/app/micronaut-graalvm-helloworld/target/micronaut-graalvm-helloworld /app/micronaut-graalvm-helloworld
ENTRYPOINT ["/app/micronaut-graalvm-helloworld"]