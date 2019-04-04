# TODOs #

## cpanspec ##

* Review messages for a verbosity level.
* Verify version checks are correct and used in all the required places
* Verify library handling. e.g. Devel::CheckLib etc
* Use caching for yum & dnf
* Some things are still yum only and need dnf added
* Try and consolidate yum/dnf commands
* Review use of qx, it doesn't catch failures
* Review FIXME's & BUGBUG

## cs-docker ##

* catch \<CTRL\>-C and use "docker stop ..."
    * <http://www.weave.works/my-container-wont-stop-on-ctrl-c-and-other-minor-tragedies/>
* Make sure any deps built in the Dockerfile get put in the right place
* Handle --verbose as cpanspec does

## dist-import ##

* This is a script that checks what changes needs to be made in koji/brew (branching, dist creation, etc)
* include it?
* make --import take a list of srpms instead of one srpm
