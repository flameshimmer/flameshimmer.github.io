use strict;
use warnings;


sub cmd {
	my $cmd = shift;
	print "[CMD]: $cmd\n";
	my $output = qx/$cmd/;
	print "$output\n\n";	
}

chdir "C:\\Users\\flame\\OneDrive\\Desktop\\2022\\Leet2022\\tools\\webpageGen\\";
cmd('perl C:\Users\flame\OneDrive\Desktop\2022\Leet2022\tools\webpageGen\genwebpage.pl');
cmd('perl C:\Users\flame\OneDrive\Desktop\2022\Leet2022\tools\webpageGen\format.pl');
cmd('perl C:\Users\flame\OneDrive\Desktop\2022\Leet2022\tools\webpageGen\genReviewPage.pl');

print "\n\n\nCompleted!\n\n\n";
