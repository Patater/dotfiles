#!/usr/bin/env perl

use strict;
use warnings;

use URI;

my $DEST="/code";
my $repoURL = $ARGV[0];

if (!defined $repoURL) {
    print "Please provide a git URL\n";
}

my $url = URI->new($repoURL);

if (defined $url->scheme()) {
    print "Scheme: ", $url->scheme(), "\n";
}

if (defined $url->userinfo()) {
    print "Userinfo: ", $url->userinfo(), "\n";
}

if (defined $url->host()) {
    print "Hostname: ", $url->host(), "\n";
}

if (defined $url->port()) {
    print "Port: ", $url->port(), "\n";
}

if (defined $url->path()) {
    print "Path: ", $url->path(), "\n";
}

if (defined $url->query()) {
    print "Query: ", $url->query(), "\n";
}

# Remove .git from path if it exists, for a clean directory name
(my $folder = $url->path) =~ s/\.[^.]+$//;

my $directory = $DEST. '/' . $url->host . $folder;

print "git clone --recursive $url $directory\n";

system("mkdir -p $directory");
system("git clone --recursive $url $directory");
