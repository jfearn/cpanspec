# cpanspec #

This is my fork of cpanspec, it is focused on:

1. Using Docker as a chroot environment for building packages
1. Allowing overriding core perl modules by installing in site instead of vendor

Upstream project is at [sourceforge](http://cpanspec.sourceforge.net/). More information is available on the [Fedora Project Wiki](http://fedoraproject.org/wiki/Perl/cpanspec).

The system produces a complete list of Source and Binary RPMS and a yum repo containing the binary RPMS.

## Configure Docker ##

<https://developer.fedoraproject.org/tools/docker/docker-installation.html>
<https://docs.docker.com/engine/admin/volumes/volumes/#create-and-manage-volumes>

## Build Fedora 22 docker image ##

This only needs to be done occasionally to keep Fedora up to date.

```bash
    cs-docker --build --image fedora26
```

or from a git checkout.

```bash
    bin/cs-docker --build --image fedora26 --docker_dir Dockerfiles
```

## Create RPMs for a Perl Module and all missing deps ##

```bash
    cs-docker --image fedora26 --package Test::ConsistentVersion
```

## Create RPMs for a local perl SRPM then a CPAN Module ##

```bash
    cs-docker --image fedora26 --package gdome2-0.8.0-1.src.rpm --package Test-ConsistentVersion-0.1.tgz --package Net::SAML2
```

## Copy the generated yum repo to another server ##

```bash
    cs-docker --image fedora26 --sync --to <path_to_copy_to>
```

## Some useful Docker commands ##

```bash
    docker images
    docker rmi $IDs
    docker volume ls
    docker volume inspect cpanspec-test
    docker volume ls -q | xargs docker volume inspect
    docker volume ls -q | xargs docker volume rm
```

### Shell in to the Fedora 22 container ###

```bash
    docker run --user=cpanspec --rm -i -t -v ~/cpanspec/fedora26:/home/cpanspec/work_dir cpanspec-fedora22 /bin/bash

    cd-docker  --image fedora22 --shell
```

### Terminate all containers ###

```bash
    docker ps -q | xargs --no-run-if-empty docker stop
```

### Delete all local containers ###

```bash
    docker ps -qa | xargs --no-run-if-empty docker rm
```

### Delete all local images ###

```bash
    docker images -q | xargs --no-run-if-empty docker rmi
```
