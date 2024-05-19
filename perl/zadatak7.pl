#!/usr/bin/perl -w

while(<>){
	if ($_ =~ m/[\s]*<li>[\s]*(.*)<\/li>/i){ # jedan zapis - jedan red, ignoriramo velika i mala slova
		$red = $1;
		($author, $title, $publisher, $year_oznaka) = split /, /, $red;
		$title =~ m/<i>(.*)<\/i>/i; #title je ono izmedu <i>...</i>
		$title = $1;
		($year, $oznaka) = (split / /, $year_oznaka);
		$oznaka = substr($oznaka, 1, ); # micanje pocetne zagrade
		$oznaka = substr($oznaka, 0, -1); # micanje straznje zagrade
		print "\@book{$oznaka, ";
		print "\n\tauthor = \"$author\", ";
		print "\n\ttitle = \"$title\", ";
		print "\n\tpublisher = \"$publisher\", ";
		print "\n\tyear = \"$year\"\n}\n\n";
	}
}