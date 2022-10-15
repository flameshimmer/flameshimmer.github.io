use strict;
use warnings;
use DateTime;

open IN, "<C:\\Users\\flame\\OneDrive\\Desktop\\2022\\Leet2022\\Leet2022.cpp" or die "can't open Leet2022.cpp!: $!";
my @lines = <IN>;
close IN;

=pod
	//8/25/2022
	//Solution2022::LongestCommonPrefix::Main();
	//Solution2022::ValidParentheses::Main();
	//Solution2022::MergeTwoSortedLists::Main();
	//Solution2022::RemoveDuplicatesfromSortedArray::Main();
=cut
my $start = 0;
my @all = ();

my $content = '<!doctype html>
<html>
<head>
<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-151395790-1"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag(\'js\', new Date());

  gtag(\'config\', \'UA-151395790-1\');
</script>

<title>Ning\'s study page 2022</title>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css" integrity="sha384-6pzBo3FDv/PJ8r2KRkGHifhEocL+1X2rVCTTkUfGk7/0pbek5mMa1upzvWbrUbOZ" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js" integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd" crossorigin="anonymous"></script>

<link rel="stylesheet" href="./web/index.css" />
</head>
<body>
<h1>Ning\'s Review Page</h1>
<ol>
';

my %hashset = ();
my @allProblems = ();

#//Solution2022::MarketAnalysisII::Main();
for my $line (@lines) {
	if ($line =~ m/Problem Starts/) {
		$start = 1;
	}
	elsif ($line =~ m/Problem Ends/) {
		$start = 0;
	}
	elsif ($start == 1 && $line =~ m/Solution2022::(.*)::/) {
		my $problemName = $1;
		if (exists $hashset{$problemName}) {next;}
		$hashset{$problemName} = 1;	
		my $url = './code/' . $problemName . '.html'; 
		my $problemSnakeName = decamelizeAndFix($problemName);
		my $leetWebsiteUrl = 'https://leetcode.com/problems/'.$problemSnakeName.'/';
		print "$leetWebsiteUrl\n";
		push(@allProblems,  "\t\t<li><a href=\"$url\">$problemName</a>&nbsp; &nbsp;<a href=\"$leetWebsiteUrl\">leet</a></li>\n");
	}	
}

# @allProblems = sort @allProblems;

@allProblems = reverse @allProblems;

my $today = DateTime->today(time_zone => 'local');
my $i = 0;
my $j = 0;
my $ii = 0;
for my $p (@allProblems) {
	if ($i > 244) {
		if ($ii % 20 == 0) {
			my $date = $today->clone->add(days => $j)->ymd('/');
			$p = "\n<h2>" . $date."</h2>\n" . $p;
			$j++;
		}
		if ($ii % 10 == 0) {$p = "\n<hr>\n" . $p;}
		$ii++;
	}
	$content = $content . $p;
	$i++;
}

$content = $content . "</ol>\n</body>\n</html>\n";

open OUT, ">index.html" or die;
print OUT $content;
close OUT;
print "\n\nCompleted!\n\n";

sub camelize {
    my ($s) = @_;
    $s =~ s{(\w+)}{
        ($a = lc $1) =~ s<(^[a-z]|_[a-z])><
            ($b = uc $1) =~ s/^_//;
            $b;
        >eg;
        $a;
    }eg;
    $s;
}

sub decamelize {
    my ($s) = @_;
    $s =~ s{(\w+)}{
        ($a = $1) =~ s<(^[A-Z]|(?![a-z])[A-Z])><
            "-" . lc $1
        >eg;
        substr $a, 1;
    }eg;
    $s;
}

sub decamelizeAndFix {
	my $str = shift;
	$str =~ s/III/Iii/g;
	$str =~ s/II/Ii/g;
	$str =~ s/RLE/Rle/g;
	$str =~ s/BST/Bst/g;
	$str =~ s/LRU/Lru/g;
	$str =~ s/LFU/Lfu/g;
	$str =~ s/IV/Iv/g;
	$str =~ s/VI/Vi/g;
	$str =~ s/VII/Vii/g;
	$str =~ s/VIII/Viii/g;
	$str =~ s/AND/And/g;
	$str =~ s/IX/Ix/g;	
	$str = decamelize($str);
	$str =~ s/of\-/\-of\-/g;
	$str =~ s/with\-/\-with\-/g;
	$str =~ s/in\-/\-in\-/g;
	$str =~ s/to\-/\-to\-/g;
	$str =~ s/or\-/\-or\-/g;
	$str =~ s/the\-/\-the\-/g;
	$str =~ s/from\-/\-from\-/g;
	$str =~ s/ofa\-/\-of\-a\-/g;
	$str =~ s/ina\-/\-in\-a\-/g;	
	return $str;
}