import sys

dim1=[]
dim2=[]
matrica1={}
matrica2={}
matrica_rezultat={}

def citanjeMatrice(redovi, dim, matrica): # promijenit ce poslane argumente jer su liste izmjenjljivi objekti
	if(len(redovi[0].split(' ')) < 2):
		print ("U prvom redu trebaju biti dimenzije matrice")
		return 0
	else:
		dim.append(redovi[0].split(' ')) # u odgovarajucu dim listu stavi dimenzije matrice
		redovi.pop(0)
		for el in redovi:
			x=el.split(" ")[0]
			y=el.split(" ")[1]
			if (int(x) > int(dim[0][0]) or int(y) > int(dim[0][1])):
				print ("Neispravni indeksi elementa")
				return 0
			else:
				val=el.split(" ")[2]
				matrica[int(x), int(y)]=float(val) # pohrani vrijednosti matrice
		return 1

def citanjeMatrica(datoteka):
	redovi=datoteka.readlines()
	redovi=[r.rstrip() for r in redovi]
	# print (redovi)
	redovi1=redovi[0:redovi.index('')] # prva rijetka matrica
	redovi2=redovi[redovi.index('')+1:] # druga rijetka matrica
	return citanjeMatrice(redovi1, dim1, matrica1) and citanjeMatrice(redovi2, dim2, matrica2)

def pomnoziMatrice():
	if(dim1[1] != dim2[0]): # razlicit broj redaka i stupaca matrica
		print("Nije moguce pomnoziti matrice!")
		return 1
	else:
		for i in range(int(dim1[0])): # redovi prve matrice
			for j in range(int(dim2[1])): # stupci druge matrice
				for k in range(int(dim1[1])): # stupci prve matrice
					if matrica_rezultat.get((i,j)) is None:
						matrica_rezultat[(i,j)] = 0
					matrica_rezultat[i, j] += matrica1.get((i,k),0) * matrica2.get((k,j),0)
		for x in [k for k,v in matrica_rezultat.items() if v==0]: # pretvara ju u cistu tako da mice one vrijednosti koje su 0
			del matrica_rezultat[x]
		return 0

def ispisiPunuMatricu(matrix, dim):
	for x in range(int(dim[0])):
		for y in range(int(dim[1])):
			if matrix.get((x,y)) is None: # ako nema vrijednosti za te indekse, onda je na tom mjestu nula
				print ("%8.2f" % 0, end =" ")
			else:
				print ("%8.2f" % matrix.get((x,y)), end =" ")
		print ()

def zapisiRezultatuDatoteku(rezultat, dat):
	# matrica je vec prije pretvorena u cistu pa se sad samo mora zapisati u datoteku
	#print("pisem u datoteku")
	dat.write(dim1[0] + " " + dim2[1] + "\n")
	for (k,v) in rezultat.items():
		dat.write(str(k[0])+" " + str(k[1]) + " " + format(rezultat[k], '.2f') + "\n")

if len(sys.argv) < 3:
	print("Potrebno je unijeti ime datoteke s matricama i ime datoteke za rezultat.")
	exit(1)

dat_read=open(sys.argv[1], 'r')
dat_write=open(sys.argv[2], 'w')

rez = citanjeMatrica(dat_read)

if (rez == 1): # ako su uspjesno procitane matrice onda nastavlja -> mogla sam stavit exit, ali dobro
	dim1=dim1[0]
	dim2=dim2[0]
	rez = pomnoziMatrice()
	if (rez == 0):
		print("A:")
		ispisiPunuMatricu(matrica1, dim1)
		print("B:")
		ispisiPunuMatricu(matrica2, dim2)
		print("A*B:")
		ispisiPunuMatricu(matrica_rezultat, [dim1[0], dim2[1]])
		zapisiRezultatuDatoteku(matrica_rezultat, dat_write)
