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
You can now run the `jar` version from the `target` directory:

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
Next, let's build a native image of our application.

Edit the `pom.xml` file and uncomment the Graal dependency (lines 93-98) and the Graal plugin (lines 125-147).

Package the application:

```bash
$ ./mvnw package
...
[micronaut-graalvm-helloworld:12406]     (inline):   2,971.36 ms,  5.62 GB
[micronaut-graalvm-helloworld:12406]    (compile):  49,922.64 ms,  6.91 GB
[micronaut-graalvm-helloworld:12406]      compile:  61,715.08 ms,  6.91 GB
[micronaut-graalvm-helloworld:12406]        image:   4,883.90 ms,  6.91 GB
[micronaut-graalvm-helloworld:12406]        write:     760.46 ms,  6.91 GB
[micronaut-graalvm-helloworld:12406]      [total]: 113,450.38 ms,  6.91 GB
[INFO] ------------------------------------------------------------------------
[INFO] BUILD SUCCESS
[INFO] ------------------------------------------------------------------------
[INFO] Total time:  01:58 min
[INFO] Finished at: 2021-01-26T11:09:38-05:00
[INFO] ------------------------------------------------------------------------
```

Now run the native image version:

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
Start the container:

```bash
$ docker run -p 8080:8080 micronaut-graalvm-helloworld:jvm
 __  __ _                                  _
|  \/  (_) ___ _ __ ___  _ __   __ _ _   _| |_
| |\/| | |/ __| '__/ _ \| '_ \ / _` | | | | __|
| |  | | | (__| | | (_) | | | | (_| | |_| | |_
|_|  |_|_|\___|_|  \___/|_| |_|\__,_|\__,_|\__|
  Micronaut (v2.3.0)

13:03:15.921 [main] INFO  io.micronaut.runtime.Micronaut - Startup completed in 656ms. Server Running: http://999bd40b5e54:8080
```

```bash
$ curl http://localhost:8080/randomplay
{"name":"GraalVM Rocks!"}
```

### Deploying a native image inside a container

With this approach you only need to build the fat jar and then use Docker/Podman to build the native image.

Then build a container image, make certain the docker daemon service is running (or use `podman`).

```bash
$ ./docker-build-native.sh
```
Start the container:

```bash
$ docker run -p 8080:8080 micronaut-graalvm-helloworld:graalvm
 __  __ _                                  _
|  \/  (_) ___ _ __ ___  _ __   __ _ _   _| |_
| |\/| | |/ __| '__/ _ \| '_ \ / _` | | | | __|
| |  | | | (__| | | (_) | | | | (_| | |_| | |_
|_|  |_|_|\___|_|  \___/|_| |_|\__,_|\__,_|\__|
  Micronaut (v2.3.0)

08:01:53.208 [main] INFO  io.micronaut.runtime.Micronaut - Startup completed in 64ms. Server Running: http://0d1168f199ff:8080
```

```bash
$ curl http://localhost:8080/randomplay
{"name":"Java Rocks!"}
```

```bash
$ docker images
REPOSITORY                               TAG                       IMAGE ID       CREATED             SIZE
micronaut-graalvm-helloworld            graalvm                    3779528da123   12 minutes ago      83.1MB
micronaut-graalvm-helloworld            jvm                        ae6f8aea4300   45 minutes ago      300MB
```


