#!/usr/bin/perl

# seems my words file is not sorted;
# this script will take in a file and sort the words then write out to another file.
# perl sorting sorts using the ascii numbers; so best to change the words to the same case before proceeding with sorting.

my @array;
my $file_name = "sorted_words";

chomp(@array = <>);

@array = map lc, (@array);
@array = sort @array;

print "Finished sorting the array.\n";

open(my $fh, '>', $file_name) or die "Could not open filname : $file_name : $!";

foreach (@array){
    print $fh "$_\n";
}

close $fh;
