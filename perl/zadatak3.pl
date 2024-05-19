#!/usr/bin/perl
foreach $file (@ARGV){
	@files = glob($file);
	foreach $f (@files){
		open LOG, "<", "$f";
		while( $red = <LOG>){
			($datum) = $f =~ m/([\d]{4}-[\d]{2}-[\d]{2})/; # uzima datum iz imena datoteke

			if( ! defined $prethodni_datum ){
				$prethodni_datum = $datum;
			}
			if ($datum ne $prethodni_datum){
				$prethodni_datum = $datum;
				&ispisi;	
			}
			($sat) = $red =~ m/:([\d]{2}):[\d]{2}:[\d]{2}/;
			$brojpristupa[$sat] = $brojpristupa[$sat]+1;
		}
	}
}
&ispisi;

sub ispisi{
	print "Datum: $prethodni_datum\n";
	print "sat : broj pristupa\n";
	print "-------------------------------\n";
	foreach (00..23){
		if($_ < 10){ # da svi imaju dvije znamenke
			print "0";
		}
		print "$_ : $brojpristupa[$_]\n";
		$brojpristupa[$_]=0;
	}
	print "\n";
}
