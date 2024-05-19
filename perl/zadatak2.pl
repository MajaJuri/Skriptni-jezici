#!/usr/bin/perl

print "Upisi niz brojeva tako da je svaki broj u svojem redu (Ctrl+D za kraj upisivanja)\n";
@ulaz = <STDIN>;

$avg = average(@ulaz);

print "Aritmeticka sredina = $avg";

sub average{
    my @array = @_;
    foreach (@array) { 
        $sum += $_;
    }

    return $sum/@array;
}