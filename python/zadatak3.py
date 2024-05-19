import os
import re
import locale
import sys

import locale
locale.setlocale(locale.LC_ALL, '')

studenti = {} # kljuc - jmbag, vrijednost - ime prezime
bodovi = {} # kljuc - jmbag, vrijednost - mapa kljuc broj lab vjezbe vrijednost broj bodova
maxlab = 0

if (len(sys.argv) < 2):
	print ("Potrebno upisati ime direktorija u kojemu se nalaze podaci o labosima.")
	exit (1)

path=sys.argv[1]

with open('studenti.txt', 'r', encoding="utf8") as dat:
	for red in dat:
		podaci = red.rstrip().split(" ")
		studenti[podaci[0]] = [podaci[1], podaci[2]]
		bodovi[podaci[0]] = {}

datoteke = os.listdir(path) # uzme sve datoteke iz tog direktorija
for dat in datoteke:
	labdat = re.match(r'^Lab_([\d]{2})_g([\d]{2})',dat) # uzima u obzir samo datoteke u ovom obliku
	if labdat:
		labvjezba = int(labdat.group(1)) # uzme vrijednost prve zagrade iz regexa
		if (labvjezba > maxlab):
			maxlab = labvjezba
		grupa = int(labdat.group(2)) # uzme vrijednost druge zagrade iz regexa
		with open(dat, 'r', encoding="utf8") as d:
			for red in d:
				podaci = red.rstrip().split(" ")
				if (podaci[0] not in bodovi):
					print ("Student " + podaci[0] + " nije zapisan u datoteci studenti.txt\n")
				else:
					if labvjezba in bodovi[podaci[0]]:
						print("Upozorenje - student " + podaci[0] + " se nalazi na dva popisa za lab. vjezbu " + str(labvjezba) + "\n")	
					else:
						bodovi[podaci[0]][labvjezba] = podaci[1]						

s = "{:11s} {:20s}".format("JMBAG", "Prezime, Ime")
for i in range (1, maxlab+1):
	s += "{:<2s}".format("L" + str(i) + "\t")
print(s)
for jmbag in studenti.keys():
	imeprezime = studenti[jmbag][0] + ", " + studenti[jmbag][1]
	s = "{:11s} {:20s}".format(str(jmbag), imeprezime)
	labosi = bodovi[jmbag]
	for lab in range(1, maxlab+1):
		if lab in labosi:
			s+= ("%-8.1f" % float(labosi[lab]))
		else:
			s+= "{:8s}".format("-")
	print(s)
