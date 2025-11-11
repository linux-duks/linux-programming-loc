# Linux kernel programming language LOCs

This repository contains a Docker image to assess the number of lines of code (LOCs) of strictly programming languages in a specific version of the Linux kernel mainline (default is version 6.17)

## Requirements

- `docker`
- `docker compose`

## Running the container

In the root of this directory, run

```shell
docker compose up --build
```

and you will see the number of LOCs printed in the standard output.

## Configure the Linux version

Change the value of the `KERNEL_VER` environment variable inside the `Dockerfile`.
