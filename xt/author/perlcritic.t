#!perl

eval "use Test::Perl::Critic";

if ($@) {
    Test::More::plan( skip_all =>
            "Test::Perl::Critic required for testing PBP compliance" );
}
else {
    Test::Perl::Critic->import(
        -verbose  => 8,
        -severity => 5,
        -exclude  => [
            'ProhibitAccessOfPrivateData',    # to many false positives
            'ProhibitBitwiseOperators',       # -1
            'ProhibitTwoArgOpen',             # support ye Olde Perl
        ]
    );
}

Test::Perl::Critic::all_critic_ok();
