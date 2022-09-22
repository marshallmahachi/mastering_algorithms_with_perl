#!/usr/bin/perl

use warnings;
use strict;

use Fcntl qw(SEEK_SET SEEK_CUR SEEK_END);

my $filename = shift;
die "provice a filename" if !$filename;

open(my $FH, "<", $filename) or die "can't open $filename: $!";

my $line;

print tell($FH), "\n";
$line = <$FH>;
print($line, "\n");
print tell($FH), "\n";

$line = <$FH>;
print($line, "\n");
print tell($FH), "\n";

$line = <$FH>;
print($line, "\n");
print tell($FH), "\n";

