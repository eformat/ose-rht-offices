#!/bin/perl
use strict;
use Data::Dumper;
use JSON;
    
my $filename = "suncorp-branches";
open (SLURP, "<${filename}") or die ("unable to open $filename ($!)");
my $json;
{
    local $/ = undef;
    $json = <SLURP>;
    close (SLURP);
}

my $perl = from_json($json);
#print Data::Dumper->Dump([$perl->{'locations'}]);

foreach $b ( @{$perl->{'locations'}} ) {
    print '{ "name": "'. $b->{'BranchName'} .'", "city": "'. $b->{'Suburb'} .'", "code": "'. $b->{'BranchId'} .'", "street": "'. $b->{'Street1'} .'", "state": "'. $b->{'State'} .'", "zip": "'. $b->{'PostCode'} .'", "phone": "'. $b->{'BranchPhone'} .'", "fax": "'. $b->{'BranchPhone'} .'", "coordinates":[ '. $b->{'Longitude'} .','. $b->{'Latitude'} .' ]},' . "\n";
}
