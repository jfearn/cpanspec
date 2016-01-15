Name:           cpanspec
Version:        2.0_1
Release:        0%{?dist}.t1
Summary:        Generate a spec file for a CPAN module
License:        GPL+ or Artistic
Group:          Development/Libraries
URL:            http://search.cpan.org/dist/cpanspec/
Source0:        http://www.cpan.org/modules/by-module/cpanspec/cpanspec-%{version}.tar.gz
BuildRoot:      %{_tmppath}/%{name}-%{version}-%{release}-root-%(%{__id_u} -n)
BuildArch:      noarch
BuildRequires:  perl(Archive::Tar)
BuildRequires:  perl(Archive::Zip)
BuildRequires:  perl(IO::Uncompress::Bunzip2)
BuildRequires:  perl(LWP::UserAgent)
BuildRequires:  perl(Module::Build) >= 0.36
BuildRequires:  perl(Module::CoreList)
BuildRequires:  perl(Module::ExtractUse)
BuildRequires:  perl(Parse::CPAN::Packages)
BuildRequires:  perl(Pod::Simple::TextContent)
BuildRequires:  perl(Text::Autoformat)
BuildRequires:  perl(YAML)
Requires:       perl(:MODULE_COMPAT_%(eval "`%{__perl} -V:version`"; echo $version))
Requires:       yum-utils
Requires:       gcc

%description
cpanspec will generate a spec file to build a rpm from a CPAN-style Perl
module distribution.

%prep
%setup -q -n cpanspec-%{version}

%build
%{__perl} Build.PL installdirs=vendor
./Build

%install
rm -rf $RPM_BUILD_ROOT

./Build install destdir=$RPM_BUILD_ROOT create_packlist=0
find $RPM_BUILD_ROOT -depth -type d -exec rmdir {} 2>/dev/null \;

%{_fixperms} $RPM_BUILD_ROOT/*

%check
./Build test

%clean
rm -rf $RPM_BUILD_ROOT

%files
%defattr(-,root,root,-)
%doc Artistic BUGS Changes COPYING cpanspec TODO
%{_bindir}/*
%{_mandir}/man1/*
%{_datadir}/%{name}

%changelog
* Mon Aug 04 2014 Jeff fearn <jfearn@redhat.com> 2.0_1-0.t1
- New upstream.

