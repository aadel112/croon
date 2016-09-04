#!/usr/bin/env perl

do 'croon';
use Test::Simple tests => 1;
use Data::Dumper;

test_config();

sub test_config {
    $CONFIG = 'tests/conf.1';
    my %cfg = read_cfg();
    foreach my $k ( keys %cfg ) {
        #test nice/ionice range adherence
        ok( $cfg{$k}->{'nice'} <= 20 && $cfg{$k}->{'nice'} >= 0 && $DNICE <= 20 && $DNICE >= 0, "Nice ranges adhered to" );
        ok( $cfg{$k}->{'ionice'} <= 7 && $cfg{$k}->{'ionice'} >= 0 && $IONICE <= 7 && $IONICE >= 0, "IONice ranges adhered to" );

    }
}
