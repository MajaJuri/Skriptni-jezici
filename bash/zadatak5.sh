# -------------------peti zadatak------------------
if [ "$#" -lt 2 ]; then
 echo "Treba unijeti 2 argumenta."
 echo "1. argument treba biti kazalo, a 2. argument treba biti oblik imena datoteke"
 #exit 1
fi

# ako su upisana dva argumenta, mozemo nastaviti
kazalo=$1
uzorak=$2

if [ ! -d "$kazalo" ]
then
 echo "Upisan nepostojeci direktorij."
 exit 1
fi

echo "Kazalo = $kazalo"
echo "Oblik imena datoteka = $uzorak"

# s xargs output jedne naredbe postaje input druge naredbe
# s tail pokupimo zadnji red jer wc ispise broj linija za svaku datoteku po putu i onda ukupno na kraju
#find $kazalo -regex ".*$uzorak.*" | xargs wc -l # za svaku pronadenu datoteku ispise koliko ima redova
echo rezultat = $(find $kazalo -regex ".*$uzorak.*" | xargs wc -l | tail -n 1 | cut -d ' ' -f 3) redova # cut da uzme bez total


