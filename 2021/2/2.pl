#!/usr/bin/env perl
use v5.34;

my $input = 'forward 5
down 5
forward 8
up 3
down 8
forward 2';

$input =~ s/$/;/gm;
$input =~ s/^/\$/gm;
$input =~ s/ +/+=/gm;
$input =~ s/up\+/down-/;
$input .= ";\n";

my $code = '
my $forward=0;
my $down=0;
'.$input.'
print "Horizontal $forward\n";
print "Depth $down\n";
print "Multiplier ".($forward*$down)."\n";
';

eval $code;
