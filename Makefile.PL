use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME                => 'ACH::Builder',
    AUTHOR              => q{Cameron Baustian <cameronbaustian@gmail.com>},
    VERSION_FROM        => 'lib/ACH/Builder.pm',
    ABSTRACT_FROM       => 'lib/ACH/Builder.pm',
    ($ExtUtils::MakeMaker::VERSION >= 6.3002
      ? ('LICENSE'=> 'perl')
      : ()),
    PL_FILES            => {},
    PREREQ_PM => {
        'Test::More' => 0,
    },
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'ACH-Builder-*' },
);
