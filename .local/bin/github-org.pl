#!/usr/bin/env perl

use strict;
use warnings;
use LWP::UserAgent;
use JSON::PP;

# Get the organization name.
my $name = $ARGV[0] or die "Usage: $0 GITHUB_USER_OR_ORG_NAME\n";

# Create a user agent and use the GitHub v3 API.
my $ua = LWP::UserAgent->new;
$ua->default_header('Accept' => 'application/vnd.github.v3+json');

# Build list of repositories
sub build_repo_list {
    my ($url) = @_;
    my @repos;

    while ($url) {
        my $response = $ua->get($url);
        return () if $response->code == 404;    # Return empty if not found
        die "Failed to fetch repositories: " . $response->status_line
          unless $response->is_success;

        push @repos, @{decode_json($response->content)};

        # Check for more pages.
        $url = undef;
        if (my $link = $response->header('Link')) {
            ($url) = $link =~ /<(.*?)>; rel="next"/;
        }
    }

    return @repos;
}

my @repos = build_repo_list(
    "https://api.github.com/orgs/$name/repos?type=public&per_page=100");
if (@repos == 0) {
    @repos = build_repo_list(
        "https://api.github.com/users/$name/repos?type=public&per_page=100");
}
die "No repositories found for $name\n" unless @repos;

# Clone repositories
foreach my $repo (@repos) {
    my $repo_name = $repo->{name};
    my $repo_url = $repo->{clone_url};

    print "Cloning $repo_name...\n";

    my $result = system("github-clone.pl $repo_url");

    if ($result == 0) {
        print "Successfully cloned $repo_name\n";
    }
    else {
        warn "Failed to clone $repo_name\n";
    }
}

print "Finished cloning repositories.\n";
