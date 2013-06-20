#!/usr/bin/perl
use strict;
use warnings;

my $kt_now = time() - `cat /proc/uptime | cut -d"." -f1`;

sub fmt_time {
    my @time = localtime $_[0];
    $time[4]+=1;    # Adjust Month
    $time[5]+=1900;    # Adjust Year
    return sprintf '%4i-%02i-%02i %02i:%02i:%02i', @time[reverse 0..5];
}

foreach my $line (<>) {
    if( $line =~ m/\[\s*(\d+)\.(\d+)\](.*)/i ){
        print "[" . fmt_time( $kt_now + $1 ) . "]" . $3 . "\n";
    }
}
