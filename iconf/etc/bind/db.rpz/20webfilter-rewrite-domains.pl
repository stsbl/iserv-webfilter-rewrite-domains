#!/usr/bin/perl -CSDAL

use warnings;
use strict;
use IServ::Conf;

my $fn = "/var/lib/iserv/config/config.pm";
my @DomainsReplace = ();
my @DomainsReplacement = ();

if (-r $fn) {
  require $fn;
  @DomainsReplace = @{$conf->{WebfilterRewriteDomainsReplace}};
  @DomainsReplacement = @{$conf->{WebfilterRewriteDomainsReplacement}};
}

sub config()
{

  if (@DomainsReplace ne @DomainsReplacement) {
    print STDERR "WebfilterRewriteDomainsReplace and WebfilterRewriteDomainsReplacement must have the same amount of domains!\n";
    exit 1
  }
  
  print "; Custom definitions for domain rewritings\n";
    
  for (my $i = 0; $i lt @DomainsReplace; $i++) {
    print $DomainsReplace[$i].' IN CNAME '.$DomainsReplacement[$i].'.'."\n";
  }

  print "\n";
}

if (@DomainsReplace < 1) {
  exit 0; 
}

config() unless @DomainsReplace < 1;
