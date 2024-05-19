#!/usr/bin/perl

print "Upisi niz znakova: ";
$niz = <STDIN>;
print "Upisi broj ponavljanja: ";
$n = <STDIN>;

while ($n > 0){
 print $niz;
 $n = $n - 1;
}