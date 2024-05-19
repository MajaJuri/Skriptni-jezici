import sys

def uzmi_elemente(lista):
	polje=[]
	for i in range(10, 100, 10): # za svaki kvatil uzima se HD
		polje.append(lista[int(i/100*len(lista))-1]) # -1 jer uzimamo n-ti element po redu, a ne element na n-tom indeksu
	return polje

if(len(sys.argv) < 2):
	print ("Potrebno upisati ime datoteke s hipotezama.")
	exit (1)

# ispis zaglavlja
lista = [str(x) for x in range(10, 100, 10)]
print("Hyp#Q" + "#Q".join(lista))

datoteka=open(sys.argv[1], 'r');
hipoteze=datoteka.readlines();
hipoteze=[h.rstrip() for h in hipoteze]

for i in range(0, len(hipoteze)):
	sortirano = sorted(hipoteze[i].split(' '), key=float) # uzme brojeve iz jedne hipoteze i sortira ih
	ispis = "%03d" % (i+1)
	for x in uzmi_elemente(sortirano):
		x=float(x)
		ispis=ispis+"#%.1f" % x
	print(ispis)
	