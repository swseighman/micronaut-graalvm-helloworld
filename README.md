## Basic Micronaut GraalVM Demo

We'll learn how to create a Hello World Micronaut GraalVM application. To get started, clone the git repository:

```bash
$ git clone https://github.com/swseighman/micronaut-graalvm-helloworld.git
```

Change directory to `micronaut-graalvm-helloworld`:

```bash
$ cd micronaut-graalvm-helloworld
```

```bash
$ ./mvnw package
```
You can run either the JAR or native-image version:

**JAR:**

```bash
$ java -jar target/micronaut-graalvm-helloworld-0.1.jar
16:11:07.159 [main] INFO  io.micronaut.runtime.Micronaut - Startup completed in 630ms. Server Running: http://:8080
```
In a separate terminal, send a request to the service:

```bash
$ curl http://localhost:8080/randomplay
{"name":"Java Rules!"}
```

**native-image:**

```bash
$ target/micronaut-graalvm-helloworld
16:13:34.873 [main] INFO  io.micronaut.runtime.Micronaut - Startup completed in 46ms. Server Running: http://:8080
```
In a separate terminal, send a request to the service:

```bash
$ curl http://localhost:8080/randomplay
{"name":"GraalVM Rocks!"}
```

### Deploying a JAR inside a container

With this approach you only need the fat jar.

Build a container image, make certain the docker daemon service is running (or use `podman`).

```bash
$ ./docker-build-jvm.sh
```

```bash
$ curl http://localhost:8080/randomplay
{"name":"GraalVM Rocks!"}
```

### Deploying a native image inside a container

With this approach you only need to build the fat jar and then use Docker/Podman to build the native image.

Then build a container image, make certain the docker daemon service is running (or use `podman`).

```bash
$ ./docker-build.sh
```

```bash
$ curl http://localhost:8080/randomplay
{"name":"Java Rocks!"}
```


