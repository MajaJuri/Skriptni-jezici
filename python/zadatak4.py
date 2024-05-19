import urllib.request
import re
import sys

if (len(sys.argv) < 2):
	print ("Potrebno je upisati neku web stranicu.")
	exit (1)

# procita web stranicu
adresa_web_stranice = sys.argv[1]
stranica = urllib.request.urlopen(adresa_web_stranice)
mybytes = stranica.read()
mystr = mybytes.decode("utf8")

# ispise web stranicu
print ("\n" + adresa_web_stranice + "\n")

hostovi = {} # {ime_hosta: broj_pojavljivanja}

# pronaci i izlistati sve linkove na druge stranice
linkovi = re.findall(r'href="([^"]+)"', mystr)
print ("=== Linkovi ===")
for link in linkovi:
	print (link)
	host = re.match(r'\b(?:https?:\/\/)?(?:[^@\n]+@)?(?:www\.)?([^:\/\n\?\=]+)', link)
	if(host is not None):
		# izdvaja hostname iz linka
		host = host[0].replace("http://", "")
		host = host.replace("https://", "")
		host = host.replace("www.", "")
		host = host.split("/")[0]
		# moglo se i kao hostovi[host] = hostovi.get(host, 0)+1
		if host in hostovi:
			hostovi[host] += 1
		else:
			hostovi[host] = 1


print ("\n=== Hostovi i broj pojavljivanja === ")
for host in hostovi.keys():
	print (host + " " + str(hostovi[host]))

# pronaci sve email adrese
print ("\n=== Svi e-mailovi === ")
mailovi = re.findall(r'([a-zA-Z0-9_.-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+)', mystr) # pronade sve emailove
for mail in mailovi:
	print(mail)

# prebrojati linkove na slike
print ("\n=== Broj slika na stranici === ")
slike = re.findall('<img([\w\W]+?)/>', mystr) # pronade sve img tags
print(len(slike))


