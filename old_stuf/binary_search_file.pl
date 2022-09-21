#!/usr/bin/perl

# usage: binary_search_file.pl word filename

my $word = shift;
my @array;
chomp(@array = <>); #this is really not good if the file is very huge; it loads all of the file into memory

print "finished reading all the words into memory.\n";

($word, @array) = map lc, ($word, @array); # this will convert all to lowercase
print "finished lowecasing all the words\n.";

my $index = binary_search(\@array, $word); # sub takes the ref to the array and the word to be searched.

if (defined $index){
    print "$word occurs at position $index.\n";
} else {
    print "$word doesn't occur.\n";
}

sub binary_search {
    my ($array_ref, $word) = @_;
    my $low = 0;
    my $high = @$array_ref - 1;

    while ($low <= $high){
        print "low : $low ; high : $high \n";
        my $try = int(($low + $high)/2);
        
        if ($word gt $array_ref->[$try]){
            $low = $try + 1;
        } elsif ($word lt $array_ref->[$try]){
            $high = $try -1;
        } else {
            return $try;
        }
        #$low = $try + 1, next if $array_ref->[$try] lt $word;
        #$high = $try - 1, next if $array_ref->[$try] gt $word;
        #return $try; 
    }
    return;
}