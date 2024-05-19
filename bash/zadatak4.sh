#!/bin/bash
if [ "$#" -ne 1 ]
then
 echo "Potrebno je upisati direktorij u kojem se nalaze slike"
 exit 1
fi

direktorij=$1
if [[ ! -d "$direktorij" ]]
then
 echo "Upisan nepostojeci direktorij."
 exit 1
fi

# echo $direktorij
# s ovakvim printf uzimamo samo ime datoteke bez cijele njegove putanje
# u direktoriju pronalazimo slike (type f ekstenzija .jpg) i sortiramo po nazivu
slike=$(find $direktorij -type f -iname  *.jpg -printf "%f " | sort -n)
prethodna_grupa="" 
ukupno=0
for slika in $slike
do
trenutna_grupa=$(echo $slika | cut -c 1-6)
if [ "$prethodna_grupa" = "" ] # prva grupa
then
 echo $(echo $trenutna_grupa | cut -c 5-6)-$(echo $trenutna_grupa | cut -c 1-4) : #razlozeno na mjesec i godinu
 echo "----------"
 ukupno=1
 echo "$ukupno. $slika"
 prethodna_grupa=$trenutna_grupa
elif [ "$trenutna_grupa" != "$prethodna_grupa" ] # presli u novu grupu
then
 echo "--- Ukupno: $ukupno slika -----"
 echo
 ukupno=1
 echo $(echo $trenutna_grupa | cut -c 5-6)-$(echo $trenutna_grupa | cut -c 1-4) :
 echo "$ukupno. $slika"
 prethodna_grupa=$trenutna_grupa
else ## kad su trenutna i prethodna iste
 ukupno=$((ukupno+1))
 echo "$ukupno. $slika"
fi
done

echo "--- Ukupno: $ukupno slika -----"