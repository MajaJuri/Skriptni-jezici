#!/usr/bin/perl
use open ':locale';
use locale;

$duljina_prefiksa = pop(@ARGV);

while(<>){
	chomp;
	#$red = lc $_; # pretvara sve u lowercase
	$red = "\L$_\E";
	# za svaki red nademo sve prefikse, u mapi za 1 povecamo vrijednost uz taj prefiks, ako prefiks nije prije postojao u mapi, vrijednost se poveca na 1 -> ok      
	@svi_prefiksi_u_redu = ($red =~ m/\b([\w]{$duljina_prefiksa})/g);
        foreach $prefiks (@svi_prefiksi_u_redu) {
                $prefiksi{$prefiks} += 1;
        }
}

@sortirano = (sort keys %prefiksi);
foreach $key (@sortirano){
	print "$key : $prefiksi{$key}\n";
}
