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
print "-" x 50, "\n";

my $result = binary_search(\@word_arr, $word);

if ($result) {
    print "index: ", $result->[1], "\n";
}
else {
    print "Word not found!\n";
}

exit;

sub binary_search {

    my ($word_arr, $word) = @_;

    return 0 unless ($word_arr && $word);

    # first convert the words to lower-case and remove all punctuation
    my @word_arr_clean = map { clean_word($_) } @{$word_arr};
    my $word_clean = clean_word($word);

    my $low = 0;
    my $high = scalar @word_arr_clean;

    while ($low < $high) {

        my $mid = int(($low + $high) / 2);

        if      ( $word_arr_clean[$mid] eq $word_clean ) { return [1, $mid]; }
        elsif   ( $word_arr_clean[$mid] gt $word_clean ) { $high = $mid - 1; }
        else    { $low = $mid + 1; }
    }

    return 0;
}

sub clean_word {

    my $word = shift;

    $word = lc $word;
    $word =~ s/\W//g;

    return $word;
}
