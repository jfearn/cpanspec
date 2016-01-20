# cpanspec

This is my fork of cpanspec, it is focused on:

1. Using Docker as a chroot environment for building packages
1. Allowing overriding core perl modules by installing in site instead of vendor

Upstream project is at [sourceforge](http://cpanspec.sourceforge.net/). More information is available on the [Fedora Project Wiki](http://fedoraproject.org/wiki/Perl/cpanspec).

## Build Fedora 22 docker container ##

This only needs to be done occassionally to keep Fedora up to date.

{{{
cs-docker --build --image fedora22
}}}

## Create RPMs for a Perl Module and all missing deps ##

This needs to be done whenever you want to add a new Module stack.

{{{
cs-docker --create_dir --image fedora22 --module Test::ConsistentVersion
}}}

## Shell in to the Fedora 22 container ##
{{{
docker run --user=cpanspec --rm -i -t -v /home/jfearn/cpanspec/fedora22:/home/cpanspec/work_dir cpanspec-fedora22 /usr/bin/bash
}}}

## Some useful Dpcker comamnds ##

{{{
docker images 
docker rmi $IDs
}}}

## Termiante a runaway container ##
{{{
ps aux | grep 'docker run' | grep -v grep | sed -e 's/[^ ]* *\([^ ]*\).*$/\1/g' | xargs --no-run-if-empty kill
}}}


