import urllib.request
import re
import sys

if (len(sys.argv) < 2):
	print ("Potrebno je upisati ime datoteke s podacima o diplomskim radovima.")
	exit (1)
try:
	datoteka = open(sys.argv[1], 'r', encoding="utf8")
	redovi = datoteka.readlines();
	redovi=[r.rstrip() for r in redovi]
	print("\n<UL>")
	for red in redovi:
		podaci = red.split(";")
		if (len(podaci) >= 3):
			print ("  <LI>  " + podaci[0].split(" ")[1] + " " + podaci[0].split(" ")[0] + " <I>" + podaci[1] + "</I>, " + podaci[2] + " </LI>")
	
	print("</UL>")

except IOError:
	print("Greška pri otvaranju datoteke.")
