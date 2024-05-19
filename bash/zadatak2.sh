grep -E -i "banana|jabuka|jagoda|dinja|lubenica" namirnice.txt
echo # prazan red

# -v ispisuju se linije koje ne sadrze zadani uzorak
grep -E -v -i "banana|jabuka|jagoda|dinja|lubenica" namirnice.txt
echo # prazan red

# -E za prosirenu sintaksu, tri velika tiskana slova i 6 znamenki
grep -E '[[:space:]]+[A-Z]{3}[0-9]{6}[[:space:]]+' -r ~/projekti
echo # prazan red

#find pretrazuje i sve poddirektorije, -a je and
#pronalazi one koje su mijenjane u 7 ili više dana, i 14 ili manje dana
ls -al $(find . -mtime +7 -a -mtime -14)
echo # prazan red

for i in $(seq 15); do echo $i;done;
echo # prazan red

# nije moguce pisati {1..$kraj} jer se zagrade prosiruju prije varijabli
kraj=15
for i in $(seq $kraj); do echo $i; done;
echo #prazan red