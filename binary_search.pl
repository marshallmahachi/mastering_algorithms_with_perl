#!/usr/bin/perl

use strict;

my $index = binary_search(\@array, $word);
# in this case @array will have to be sorted
# $word is the target word
# the binary_search() sub will return the index of the word in the array.




sub binary_search{
    my ($array, $word) = @;
    my ($low, $high) = (0, @$array - 1); #have not seen this @$array
    my $try;

    while($low <= $high){
        $try = int(($low + $high)/2);

        $low = $try + 1, next if $array->[$try] lt $word; #raise the bottom
        $high = $try - 1, next if $array->[$try] gt $word; # lower the top

        return $try;
    }
    return undef; # I guess this would return undef .. ? --> an empty return will return a list ; but this will return a sclar
}