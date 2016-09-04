#!/usr/bin/env perl

do 'croon';
use Test::Simple tests => 12;
use Data::Dumper;

#test loggimg level
# Log::Log4perl->easy_init($INFO);

$CONFIG = 'tests/conf.1';
%CFG = read_cfg();
$CRON = new Schedule::Cron(\&dummy_dispatcher);
$CRON->load_crontab('tests/cron.1');   

test_config();
test_croon_cmd();

sub test_config {
    foreach my $k ( keys %CFG ) {
        #test nice/ionice range adherence
        ok( $CFG{$k}->{'nice'} <= 20 && $CFG{$k}->{'nice'} >= 0 && $DNICE <= 20 && $DNICE >= 0, "Nice ranges adhered to" );
        ok( $CFG{$k}->{'ionice'} <= 7 && $CFG{$k}->{'ionice'} >= 0 && $IONICE <= 7 && $IONICE >= 0, "IONice ranges adhered to" );

    }
}

sub test_croon_cmd {
    my @entries = $CRON->list_entries();
    foreach my $r ( @entries ) {
        my %e = %$r;
        my @args = $e{'args'};
        my $cmd = $args[0][0];
        my $new_cmd = dispatcher( $cmd, 1 );
        ok( $new_cmd =~ $cmd, "New cmd contains original cmd" );
        my $rc = system( $new_cmd );
        ok( !$rc, "Return code was 0 for cmd");
    }
}

sub dummy_dispatcher {}
