# -------------------sesti zadatak------------------
#!/bin/bash
if [ "$#" -lt 2 ]; then
 echo "Treba unijeti 2 argumenta koja su kazala."
 #exit 1
fi

dir1=$1
dir2=$2
if [[ ! -d $dir1 ]]
then
 echo "Prvi upisani argument nije direktorij!"
 #exit 1
fi

if [[ ! -d $dir2 ]]
then
 echo "Drugi upisani argument nije direktorij!"
 #exit 1
fi

# za svaku datoteku iz prvog direktorija provjeriti postoji li datoteka istog imena u drugom direktoriju i usporediti vrijeme mijenjanja
for dat1_name in $(ls $dir1) #pretpostavka je da direktoriji nemaju poddirektorije pa ls daje samo fajlove
do
 dat2=$(find $dir2 -name $dat1_name)
 dat1=$(find $dir1 -name $dat1_name)
 if [ "$dat2" != "" ] #ako postoji dat2
 then   
   # ako su u isto vrijeme modified, onda nista ne sinkroniziramo
   if [ $dat1 -nt $dat2 ]
   then
    echo "$dat1 --> $dat2"
   fi
 else #ako datoteka ne postoji u dir2
   echo "$dat1 --> $dir2/$dat1_name"
 fi
done

# za svaku datoteku iz drugog direktorija provjeriti postoji li datoteka istog imena u drugom direktoriju i usporediti vrijeme mijenjanja
for dat2_name in $(ls $dir2)
do
 dat1=$(find $dir1 -name $dat2_name)
 dat2=$(find $dir2 -name $dat2_name)
 if [ "$dat1" != "" ] #ako postoji dat1
 then   
   # ako su u isto vrijeme modified, onda nista ne sinkroniziramo
   if [ $dat2 -nt $dat1 ]
   then
    echo "$dat2 --> $dat1"
   fi
 else #ako datoteka ne postoji u dir1
   echo "$dat2 --> $dir1/$dat2_name"
 fi
done