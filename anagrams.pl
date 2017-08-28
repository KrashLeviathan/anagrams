#!/usr/bin/perl
use warnings;
use strict;

use Text::CSV;

my @alphabet = split('', 'abcdefghijklmnopqrstuvwxyz');

sub usage() {
    print "USAGE: anagrams.pl input1 input2\n"
	. "       anagrams.pl -f inputfile\n";
    exit 1;
}

sub process($$) {
    my $str1 = lc(shift);
    my $str2 = lc(shift);

    # Initialize a hashmap of letters to int, with each starting at 0
    my %letters;
    for my $letter (@alphabet) {
	$letters{$letter} = 0;
    }

    # Count each letter in the first input, putting the number in the hash
    foreach(split('', $str1)) {
	next if m/[^a-z]/;
	$letters{$_} = $letters{$_} + 1;
    }

    # Iterate over the second input, subtracting from the hash counts.
    foreach(split('', $str2)) {
	next if m/[^a-z]/;
	$letters{$_} = $letters{$_} - 1;
	if ($letters{$_} < 0) {
	    return "Invalid Pattern\n";
	}
    }

    # Every value in the hash should be back to zero.
    foreach (keys %letters) {
	if ($letters{$_} != 0) {
	    return "Invalid Pattern\n";
	}
    }

    return "Valid Pattern\n";
}

sub readFile($) {
    my $filename = shift;
    my $csv = Text::CSV->new({ sep_char => ',' });
    my @output;
    
    open(INPUT_FH, "<", $filename) or die("Could not open '$filename': $!\n");
    while (<INPUT_FH>) {
	chomp;
	if ($csv->parse($_)) {
	    my @fields = $csv->fields();
	    push(@output, process($fields[0], $fields[1]));
	} else {
	    warn("Line could not be parsed: $_\n");
	}
    }
    close(INPUT_FH);

    return @output;
}

sub main() {
    if (2 != scalar(@ARGV)) {
	usage();
    }
    
    if ($ARGV[0] =~ m/^-f$/) {
	my @output = readFile($ARGV[1]);
	foreach (@output) {
	    print;
	}
    } else {
	my $result = process($ARGV[0], $ARGV[1]);
	print $result;
    }
}

main();
