use strict;
use warnings;


sub cmd {
	my $cmd = shift;
	print "[CMD]: $cmd\n";
	my $output = qx/$cmd/;
	print "$output\n\n";	
}


cmd("perl genwebpage.pl");
cmd("perl format.pl");
cmd("perl genReviewPage.pl");

print "\n\n\nCompleted!\n\n\n";
