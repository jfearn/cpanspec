use strict;
use warnings;
use Module::Build;

my $class = Module::Build->subclass(
    class => 'CpanSpec::Build',
    code  => q{
        use File::Basename qw(dirname);
        use FindBin;

        sub ACTION_build {
            my $self = shift;
            $self->SUPER::ACTION_build(@_);
            symlink("cpanspec", "$FindBin::Bin/blib/script/cpanget");
            symlink("cpanspec.1p", "$FindBin::Bin/blib/bindoc/cpanget.1p");
        }

        sub ACTION_authortest {
            my ($self) = @_;
            $self->depends_on('distmeta');
            $self->test_files( qw< t xt/author > );
            $self->recursive_test_files(1);
            $self->depends_on('test');  
        }

        sub ACTION_distdir {
            my ($self) = @_;
            $self->depends_on('authortest');
            return $self->SUPER::ACTION_distdir();
        }
    }
);

my $builder = $class->new(
    dist_name          => 'cpanspec',
    license            => 'perl',
    dist_author        => 'Steven Pritchard <steve@cpan.org>',
    dist_version_from  => 'cpanspec',
    configure_requires => {'Module::Build' => 0},
    build_requires     => {
        'Module::Build'            => 0.36,
        'Archive::Tar'             => 0,
        'Archive::Zip'             => 0,
        'IO::Uncompress::Bunzip2'  => 0,
        'IPC::Run'                 => 0,
        'File::Basename'           => 0,
        'FileHandle'               => 0,
        'Getopt::Long'             => 0,
        'locale'                   => 0,
        'LWP::UserAgent'           => 0,
        'Module::CoreList'         => 0,
        'Module::ExtractUse'       => 0.33,
        'POSIX'                    => 0,
        'Parse::CPAN::Packages'    => 0,
        'Pod::Simple::TextContent' => 0,
        'Pod::Usage'               => 0,
        'Text::Autoformat'         => 0,
        'YAML'                     => 0,
        'Perl::Version'            => 1.013,
    },
    requires => {
        'Archive::Tar'             => 0,
        'Archive::Zip'             => 0,
        'IO::Uncompress::Bunzip2'  => 0,
        'IPC::Run'                 => 0,
        'File::Basename'           => 0,
        'FileHandle'               => 0,
        'Getopt::Long'             => 0,
        'locale'                   => 0,
        'LWP::UserAgent'           => 0,
        'Module::CoreList'         => 0,
        'Module::ExtractUse'       => 0.33,
        'POSIX'                    => 0,
        'Parse::CPAN::Packages'    => 0,
        'Pod::Simple::TextContent' => 0,
        'Pod::Usage'               => 0,
        'Text::Autoformat'         => 0,
        'YAML'                     => 0,
        'Perl::Version'            => 1.013,
    },
    script_files      => ['cpanspec', 'cs-docker',],
    install_path      => {'Dockerfiles' => '/usr/share/cpanspec/Dockerfiles',},
    Dockerfiles_files => {
        'Dockerfiles/centos6'  => 'Dockerfiles/centos6',
        'Dockerfiles/fedora22' => 'Dockerfiles/fedora22',

    },
);

$builder->add_build_element('Dockerfiles');

$builder->create_build_script();

