## Basic Micronaut GraalVM Demo

Creating your first Micronaut GraalVM application

Next, we'll learn how to create a Hello World Micronaut GraalVM application. To get started, clone the git repository:

```bash
$ $ git clone https://github.com/swseighman/micronaut-graalvm-helloworld.git
```

Change directory to the `micronaut-graalvm-helloworld` subdirectory within the cloned repo:

```bash
$ cd micronaut-graalvm-helloworld
```

```bash
$ ./mvnw package
```

### Deploying a JAR inside a container

With this approach you only need the fat jar.

Build a container image, make certain the docker daemon service is running (or use `podman`).

```bash
$ ./docker-build-jvm.sh
```

### Deploying a native image inside a container

With this approach you only need to build the fat jar and then use Docker/Podman to build the native image.

Then build a container image, make certain the docker daemon service is running (or use `podman`).

```bash
$ ./docker-build.sh
```


