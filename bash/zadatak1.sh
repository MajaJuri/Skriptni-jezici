#!/bin/bash
# -------------------prvi zadatak-------------------
proba="Ovo je proba"
echo $proba
echo # prazan red

lista_datoteka=$(find *.*) # ne zelimo ispisati direktorije nego samo datoteke, mozemo i find -type f *
echo $lista_datoteka
echo # prazan red

proba3=""
for i in {1..3}
do
 proba3+=$proba
 proba3+=". "
done
echo $proba3
echo # prazan red

a=4
b=3
c=7
d=$((($a+4)*$b%$c))
echo "a=$a b=$b c=$c d=$d"
echo # prazan red

# ispisuje broj rijeci pa ime datoteke za svaku datoteku i na kraju broj ukupnih rijeci i "total"
# s tail pokupimo zadnji red
# s cut rezemo red na dijelove, uzimamo drugo polje jer je ispred broja razmak 
broj_rijeci=$(wc -w *.txt | tail -n 1 | cut -d ' ' -f 2)
echo "broj_rijeci=$broj_rijeci"
echo # prazan red

# -a ako zelimo ispisati i skrivene datoteke
echo $(ls -a ~)
echo # prazan red


