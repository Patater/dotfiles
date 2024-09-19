#!/usr/bin/env perl
use strict;
use warnings;

# Requires p5-pQuery p5-LWP-Protocol-https

use pQuery;

# Supply a date in ISO format to see the GBP=X exchange rate on that date.
# If no dates are on the command line, use a default array of dates.
my @dates = scalar @ARGV > 0 ? @ARGV : qw(
  2022-04-15
  2022-05-20
  2022-06-17
  2022-07-15
  2022-08-19
  2022-09-16
  2022-10-21
  2022-11-18
  2022-12-16
  2023-01-20
  2023-02-17
  2023-03-17
);

for my $date (@dates) {
    my $url = 'https://www.xe.com/currencytables/?from=USD&date=';
    $url .= $date;

    pQuery($url)
      ->find("table[class^='currencytables__Table'] "
          . "td:contains('British Pound') + td")->each(
        sub {
            my $i = shift;
            print $date, " => ", pQuery($_)->text(), "\n";
        }
          );
}
