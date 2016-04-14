#!/bin/perl
use strict;
use Data::Dumper;
use JSON;

my $filename = "redpages-v2.json";

open (SLURP, "<${filename}") or die ("unable to open $filename ($!)");
my $json;
{
    local $/ = undef;
    $json = <SLURP>;
    close (SLURP);
}

my $perl = from_json($json);
#print Data::Dumper->Dump([$perl->{'table'}->{'rows'}]);

foreach $b ( @{$perl->{'table'}->{'rows'}} ) {
    next unless $b->[0] =~ 'Westpac Branch';
    #print Data::Dumper->Dump([$b]);
    print '{ "name": "'. $b->[0] .'", "city": "'. $b->[3] .'", "code": "'. $b->[7] .'", "street": "'. $b->[4] .'", "state": "'. $b->[3] .'", "zip": "'. $b->[4] .'", "phone": "+5555555", "fax": "+5555555", "coordinates":[ '. $b->[6] .','. $b->[5] .' ]},' . "\n";
}

