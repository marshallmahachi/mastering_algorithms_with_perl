#!/usr/bin/perl

use warnings;
use strict;

use lib '.';
use Address;

# qw(name street city country)

my $address = Address->new(
    {   name    => 'Marshall',
        street  => '191 Constance Street',
        city    => 'Brisbane',
        country => 'Australia',
    });

print "REF: ", ref $address, "\n\n";

$address->country('Zimbabwe');

my $stringified_address = $address->as_string;
print $stringified_address;

exit;