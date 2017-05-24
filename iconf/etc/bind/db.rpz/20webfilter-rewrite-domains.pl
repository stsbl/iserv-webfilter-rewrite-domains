#!/usr/bin/perl -CSDAL

use warnings;
use strict;
use IServ::Conf;

my @DomainsReplace = ();
my @DomainsReplacement = ();

@DomainsReplace = @{$conf->{WebfilterRewriteDomainsReplace}};
@DomainsReplacement = @{$conf->{WebfilterRewriteDomainsReplacement}};

sub config()
{

  if (@DomainsReplace ne @DomainsReplacement) {
    print STDERR "WebfilterRewriteDomainsReplace and WebfilterRewriteDomainsReplacement must have the same amount of domains!\n";
    exit 1
  }
  
  print "; Custom definitions for domain rewritings\n";
  my $i = 0;
  foreach my $replace (@DomainsReplace) {
    print "$replace IN CNAME $DomainsReplacement[$i].\n";
    $i++;
  }
  print "\n";
}

if (@DomainsReplace < 1) {
  exit 0; 
}

config() unless @DomainsReplace < 1;
