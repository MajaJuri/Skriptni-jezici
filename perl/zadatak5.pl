#!/usr/bin/perl

while ($red = <>) {
	chomp $red;
	$red =~ s/^#.*$//; #izbacujemo komentirane retke
	$red =~ s/-/0/g; #treba kasnije za racunanje
	push @redovi, $red;
}
# mogla sam faktore dobiti i sa shiftom, ali dobro
$prvi_red_procitan = 0;
foreach $r (@redovi){
	if($r ne ""){ # ignoriranje praznih redova
	if($prvi_red_procitan == 0){
		$prvi_red_procitan = 1;
		@faktori = split /;/, $r;
	}else{
			($jmbag, $prezime, $ime, $komponente) = split(/;/, $r, 4); # treci argument je limit, splitta se u 4 polja
			@komponente = split /;/, $komponente;
			$kljuc = $prezime . ", " . $ime . " (" . $jmbag . ")";
			#print "$kljuc\n";
			my $bodovi = 0;
			foreach $index (0..$#faktori){
				#print "\t$komponente[$index]*$faktori[$index]\n";
				$bodovi += $komponente[$index]*$faktori[$index];
			}
			#print "bodovi = $bodovi\n";
			$rezultati{$kljuc} = $bodovi; 
	}
	}
}

# sortiranje po vrijednosti
$i = 1;
print "Lista po rangu:\n-------------------\n";
foreach my $student (sort { $rezultati{$b} <=> $rezultati{$a} } keys %rezultati) {
	$sortirano{$i} = $student . " : " .  $rezultati{$student};
	print "$i. $sortirano{$i}\n";
	$i += 1;
}
#slucajno je ostala ovaj potprogram
sub izracunaj{
	my $bodovi = 0;
	for ( (0..$#faktori)){
		$bodovi += $komponente[$_]*$faktori[$_];
	}
	printf "bodovi = %.2f", $bodovi;
	$bodovi;
}
	