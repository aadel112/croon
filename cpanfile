#!/usr/bin/env perl

requires 'Schedule::Cron';
requires 'Getopt::Std';
requires 'File::Basename';
requires 'Log::Log4perl';
requires 'Data::Dumper';

on 'test' => sub {
    requires 'Test::Simple'; 
}
