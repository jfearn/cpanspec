# cpanspec

This is my fork of cpanspec, it is focused on:

1. Using Docker as a chroot environment for building packages
1. Allowing overriding core perl modules by installing in site instead of vendor

Upstream project is at [sourceforge](http://cpanspec.sourceforge.net/). More information is available on the [Fedora Project Wiki](http://fedoraproject.org/wiki/Perl/cpanspec).

The system produces a complete list of Source and Binary RPMS and a yum repo containing the binary RPMS.

## Build Fedora 22 docker image ##

This only needs to be done occasionally to keep Fedora up to date.

	cs-docker --build --image fedora22

## Create RPMs for a Perl Module and all missing deps ##

	cs-docker --create_dir --image fedora22 --module Test::ConsistentVersion

## Create RPMs for a local perl SRPM then a CPAN Module ##

	cs-docker --create --image fedora22 --file gdome2-0.8.0-1.src.rpm --module Net::SAML2

## Copy the generated yum repo to another server ##

	scp -r ~/cpanspec/fedora22/<package_build_dir>/repo myserver:/repos/<package>

## Some useful Docker commands ##
	docker images 
	docker rmi $IDs

### Shell in to the Fedora 22 container ###

	docker run --user=cpanspec --rm -i -t -v ~/cpanspec/fedora22:/home/cpanspec/work_dir cpanspec-fedora22 /usr/bin/bash

### Terminate all containers ###

	docker ps -q | xargs --no-run-if-empty docker stop

### Delete all local conrtainers ###

	docker ps -qa | xargs --no-run-if-empty docker rm

### Delete all local images ###

	docker images -q | xargs --no-run-if-empty docker rmi

