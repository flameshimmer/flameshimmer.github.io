use strict;
use warnings;

my @lines;


my %hash = ();
my $filedir = "./code";

opendir(my $dir, $filedir) or die "Could not load directory";
my @read_dir = sort grep {!-d}readdir($dir);
foreach my $fileInDir(@read_dir)
{
    my $fh = "$filedir/$fileInDir";
    processFile($fh);
}

print "\n\nCompleted!\n\n\n";


sub processFile {
    my $filename = shift;
    open IN, "<$filename" or die "Can't open file: $filename!\n";
    my @lines = <IN>;
    close IN;

    my $content = "";
    for my $line (@lines) {
        if ($line =~ m/.*\[\s*(\[\s*(([^,]+),?\s*)+\s*\]\s*,?\s*)+\s*\]/) {
            $line =~ s/\[/\n\[/g;
            $line =~ s/\]\]/\]\n\]/g;
            $content = $content . $line;
        }else {
            $content = $content . $line;
        }
    }
    open OUT, ">$filename" or die "Can't write to file: $filename!\n";
    print OUT $content;
    close OUT;
}