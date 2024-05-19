#!/usr/bin/perl

while (defined($red = <>)) {
	if ($prvi_red == 0){
		$prvi_red = 1;
	}else{
		@podaci = split /;/, $red;
		
		@termin = split / /, $podaci[3];
		@zakljucano = split / /, $podaci[4];

		if($termin[0] eq $zakljucano[0]){ # mora biti isti datum, inace nije ok
			($termin_sat) = $termin[1] =~ m/([\d]):[\d]{2}/;
			($zakljucano_sat) = $zakljucano[1] =~ m/([\d]):[\d]{2}/;
  			if ($zakljucano_sat > $termin_sat){
  				&ispisi($red);
  			}
		}else{
			&ispisi($red);
		}		
	}
}

sub ispisi(){
	@podaci = split /;/, $_[0];
	print "$podaci[0] $podaci[1] $podaci[2] - PROBLEM: ";
	($termin_od) = $podaci[3] =~ m/(^[\d-]+[ ][\d:]+)/;
	print "$termin_od --> ";
	print "$podaci[4]";
}
