#!/bin/perl
use strict;
use Text::ParseWords;
    
my $filename = "/home/mike/Downloads/Centrelink-Office-Locations-as-at--3-March-2016.csv";
open (my $fh, "<$filename") || die "can't open $filename $!";
while (<$fh>) {
    #print $_;
    my ($office_type,$site_name,$alternative_name,$address,$suburb,$state,$postcode,$latitude,$longitude,$open,$close,$closed_for_lunch) 
	= parse_line(q{,}, 0, $_);
    print '{ "name": "'. $site_name .'", "city": "'. $suburb .'", "code": "'. $site_name .'", "street": "'. $address .'", "state": "'. $state .'", "zip": "'. $state .'", "phone": "+61 555 555 5555", "fax": "+61 555 555 5555", "coordinates":[ '. $longitude .','. $latitude .' ]},' . "\n";
}
