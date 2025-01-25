#!/usr/bin/env perl

use strict;
use warnings;
use File::Path qw(make_path);

# Check if the input file is provided.
die "Usage: $1 <input_file> <regex_pattern>\n" unless @ARGV == 2;

my ($input_file, $regex_pattern) = @ARGV;

# Open the input file.
open my $fh, '<', $input_file or die "Cannot open file '$input_file': $!";

while (my $url = <$fh>) {
    chomp $url;

    # Extract the name using the provided regex pattern.
    my ($name) = $url =~ /$regex_pattern/;

    if ($name) {

        # Create the directory.
        make_path($name) or die "Failed to create directory '$name': $!";

        # Create a new file in the directory.
        my $output_file = "$name/batch.txt";
        open my $out_fh, '>', $output_file
          or die "Cannot create file '$output_file': $!";

        # Write the full URL to the file.
        print $out_fh "$url\n";
        close $out_fh;

        print "Created directory '$name' and saved URL to $output_file\n";
    }
    else {
        warn "Could not extract name from URL: $url\n";
    }
}

close $fh;

print "Processing complete.\n";
