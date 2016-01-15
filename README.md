# cpanspec

This is my fork of cpanspec, it is focused on:

1. Using Docker as a chroot environment for building packages
1. Allowing overriding core perl modules by installing in site instead of vendor

Upstream project is at [sourceforge](http://cpanspec.sourceforge.net/). More information is available on the [Fedora Project Wiki](http://fedoraproject.org/wiki/Perl/cpanspec).

docker build -t cpanspec-eng-rhel-7 --file=extras/Dockerfile-eng-rhel-7 .

## BUGBUG make --create-dir option to create a sub dir to put the packages in, make it include theOS or soemthing ##
{{{
mkdir -p $HOME/cpanspec
sudo chcon -R -t svirt_sandbox_file_t $HOME/cpanspec

docker run -i -t -v $HOME/cpanspec:$HOME/cpanspec cpanspec-eng-rhel-7  /usr/bin/cpanspec --build --follow --packager 'Jeff Fearn <jfearn@redhat.com>' Path::Abstract


docker images 
docker rmi $IDs

ps aux | grep 'docker run' | grep -v grep | sed -e 's/[^ ]* *\([^ ]*\).*$/\1/g' | xargs --no-run-if-empty kill

Argument "v1.0.1" isn't numeric in numeric lt (<) at /home/cpanspec/work_dir/cpanspec line 1588.
Argument "v0.6.1" isn't numeric in numeric lt (<) at /home/cpanspec/work_dir/cpanspec line 1588.


auto_configure_requires
}}}


No package perl(CPAN::DistnameInfo) available.
No package perl(Parse::CPAN::Packages) available.
No package perl(Pod::Strip) available.
No package perl(Module::ExtractUse) available.


    9  yum install -y rpmbuild
   10  yum install -y rpm-build
   11  rpmbuild --rebuild perl-CPAN-DistnameInfo-0.08-2.fc22.src.rpm 
   12  yum -y install /root/rpmbuild/RPMS/noarch/perl-CPAN-DistnameInfo-0.08-2.el7.noarch.rpm
   13  rpmbuild --rebuild perl-Parse-CPAN-Packages-2.31-4.fc22.src.rpm 
   14  yum-builddep perl-Parse-CPAN-Packages-2.31-4.fc22.src.rpm
   15  rpmbuild --rebuild perl-Parse-CPAN-Packages-2.31-4.fc22.src.rpm 
   16  yum -y install /root/rpmbuild/RPMS/noarch/perl-Parse-CPAN-Packages-2.31-4.el7.noarch.rpm 
   17  rpmbuild --rebuild perl-Pod-Strip-1.02-5.el6eng.src.rpm 
   18  yum -y install /root/rpmbuild/RPMS/noarch/perl-Pod-Strip-1.02-5.el7.noarch.rpm 
   19  rpmbuild --rebuild perl-Module-ExtractUse-0.23-3.el6.src.rpm 
   20  yum-builddep perl-Module-ExtractUse-0.23-3.el6.src.rpm 
   21  rpmbuild --rebuild perl-Module-ExtractUse-0.23-3.el6.src.rpm 
   22  yum -y install /root/rpmbuild/RPMS/noarch/perl-Module-ExtractUse-0.23-3.el7.noarch.rpm 

t/01-basic.t ......................... Can't locate Test/Warn.pm in @INC (@INC contains: /home/jfearn/cpanspec/eng-rhel-7/Path-Abstract-0.096/blib/lib /home/jfearn/cpanspec/eng-rhel-7/Path-Abstract-0.096/blib/arch /usr/local/lib64/perl5 /usr/local/share/perl5 /usr/lib64/perl5/vendor_perl /usr/share/perl5/vendor_perl /usr/lib64/perl5 /usr/share/perl5) at (eval 16) line 2.

t/9000-legacy.t ...................... Can't locate Test/Exception.pm in @INC (@INC contains: /home/jfearn/cpanspec/eng-rhel-7/Path-Abstract-0.096/blib/lib /home/jfearn/cpanspec/eng-rhel-7/Path-Abstract-0.096/blib/arch /usr/local/lib64/perl5 /usr/local/share/perl5 /usr/lib64/perl5/vendor_perl /usr/share/perl5/vendor_perl /usr/lib64/perl5 /usr/share/perl5) at (eval 17) line 2.

t/9000-legacy.t ...................... Can't locate Test/Differences.pm in @INC (@INC contains: /home/jfearn/cpanspec/eng-rhel-7/Path-Abstract-0.096/blib/lib /home/jfearn/cpanspec/eng-rhel-7/Path-Abstract-0.096/blib/arch /usr/local/lib64/perl5 /usr/local/share/perl5 /usr/lib64/perl5/vendor_perl /usr/share/perl5/vendor_perl /usr/lib64/perl5 /usr/share/perl5) at (eval 19) line 2.


perl-Parse-CPAN-Packages perl-CPAN-DistnameInfo perl-Module-ExtractUse perl-Pod-Strip perl-Path-Abstract 
