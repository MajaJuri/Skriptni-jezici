# -------------------treći zadatak------------------
#!/bin/bash
if [ "$#" -ne 1 ]
then
 echo "Potrebno je upisati direktorij"
 exit 1
fi

direktorij=$1
if [ ! -d "$direktorij" ]
then
 echo "Upisan nepostojeci direktorij."
 exit 1
fi

# u trenutnom direktoriju pronalazi datoteke koje sadrze datum, mora biti drugi mjesec
# regextype posix-extended je kao zastavica -E u sed-u
dokumenti=$(find $direktorij -regextype posix-extended -regex  '.*[0-9]{4}-02-[0-3]{1}[0-9]{1}.*\.txt')
for doc in $dokumenti
do
 echo $doc | sed -E 's/.*([0-9]{4})-02-([0-3]{1}[0-9]{1}).*/datum: \2-02-\1/' # iz imena datoteke izvlaci datum i ispise ga
 echo '--------------------------------------------------'
 # pronalazi izraz unutar navodnika -> to je akcija
 # onda sortira i broji ponovljene retke
 # zatim sortira obrnutim redoslijedom po broju akcija
 sed -E 's/.*\"(.*)\".*/ : \1/' $doc | sort | uniq -c | sort -r
 echo # prazan red radi urednosti
done