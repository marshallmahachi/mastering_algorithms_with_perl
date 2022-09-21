#!/usr/bin/perl

use warnings;
use strict;

print "usage: './binary_search <filename> <word>'\n" and exit if @ARGV != 2;

my ($filename, $word) = @ARGV;

print "filename :", $filename, "\n";
print "word: ", $word, "\n";
print "-" x 50, "\n";

open(my $FH, "<", $filename)
    or die "Can't open < $filename: $!";

# we are reading the whole file to memory; which is not really ok
my @word_arr = <$FH>;

print "$filename has ", scalar @word_arr, " words.\n";


exit;