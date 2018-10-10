#!/bin/bash 

#clear
rm -r /home/sara/bash_HandsOn
#EXERCICI 1 TASK 1
echo "Exercici 1"

cd /home/sara 
mkdir bash_HandsOn #creem directori 
cd bash_HandsOn # entrem el el directori
mkdir bin input output logs trash #creem carpetes dins dle directori bash_HandsOn
cp -r trash trash2 #copiem el directori trash i li diem trash2
mv trash trash1 # amb el mv canviem de nom el directori trash
rm -r trash2 #elimino directori

echo "DONE"

# TASK 2
echo "exercici 2"
wget https://github.com/dgarrimar/teaching/raw/master/uvic/AdvBI_2018/data/hands-on/bash/sample-groups.tsv
mv sample-groups.tsv input.tsv #canviem el nom
mv input.tsv input #ho movem a la carpeta input
ln -s input/input.tsv trash1/input_symlink 
# aqui creo el link q em conectara el fitxer anomenat novament input.ts i el conector que m'hi porta l'anomeno input_symlink
cp input/input.tsv trash1/input_copy
# aqui creo la copia del meu fitxer input.tsv i la poso dintre de la carpeta trash1 i la renombro amb nom inpuit_copy
touch trash1/IAmLearningSomeBash
#estic crean i guardan el fitxer IALearning... dintre de la carpeta trash1
rm -r trash1 # borro tot el directori
echo "DONE"

# TASK 3
echo "exercici 3"
mkdir output/task_3 # creo carpeta task_3 en el lloc carpeta output
head -n 100 input/input.tsv > output/task_3/top100.tsv
# llegim les 100 primeres lineas del f0itxer q esta dins del input carpeta i diem que el guardi dintre carpeta output i es digui aquest fitxe nou de 100lines top100.tsv
#head llegeix pel principi part de dalt del fitxer
#tail llegeix part de abaix fitxer
tail -n 50 input/input.tsv > output/task_3/last50.tsv
#
# wc es word count
wc -l output/task_3/top100.tsv
wc -l output/task_3/last50.tsv
cat output/task_3/*.tsv >> output/task_3/150together.tsv
#cat llegeix * vol dir tots els fitxers q acaben en ".tsv")
#i diem que els concateni en un nou fitxer
#ara llegim i amb cut agafem la columna que volem, ho fem 2 vegades perque volem 2 copies
cat input/input.tsv | cut -f1 > input/aux1.tsv
cat input/input.tsv | cut -f1 > input/aux2.tsv
paste input/aux1.tsv input/aux2.tsv > output/task_3/150firstcX2.tsv
rm input/aux1.tsv input/aux2.tsv #eliminem els auxiliars perque ja no els necessitem
echo "FALTA"
echo "DONE"

# TASK 4 -------
echo "exercici 4"

mkdir output/task_4

# n for numeric sorting, r for reverse order (sort) and k 2,2 for the second column.
cut -f2 input/input.tsv | sort -r | uniq | grep -v -e Artery -e Adipose > output/task_4/unique.tissues2.txt
#aquí diem que ens ordeni del revers, ens agafi la columna 2 (cut), que no estiguin repetits, que no coincideixin amb el patro, per això posem la "-v" com a característica en el grep.
#estem dient que ens elimini també la paraula Adipose i la paraula Artery, amb el "-e".
cut -f3 input/input.tsv | sort -r | uniq | grep -v -e Artery -e Adipose > output/task_4/unique.tissues3.txt
diff output/task_4/unique.tissues2.txt output/task_4/unique.tissues3.txt > output/task_4/differences
less output/task_4/differences 
#PREGUNTAR DIFF
echo "NO hi hna diferencies entre colon, cervell, cel·lules, etc."
#> Esophagus_-_Gastroesophageal_Junction
#> Colon_-_Transverse
#> Colon_-_Sigmoid
#> Cervix_-_Endocervix
#> Cervix_-_Ectocervix
#> Cells_-_Transformed_fibroblasts
#> Cells_-_EBV-transformed_lymphocytes
#> Breast_-_Mammary_Tissue
#> Brain_-_Substantia_nigra
#> Brain_-_Spinal_cord_(cervical_c-1)
#> Brain_-_Putamen_(basal_ganglia)
#> Brain_-_Nucleus_accumbens_(basal_ganglia)
#> Brain_-_Hypothalamus
#> Brain_-_Hippocampus
#> Brain_-_Frontal_Cortex_(BA9)
#> Brain_-_Cortex
#> Brain_-_Cerebellum
#> Brain_-_Cerebellar_Hemisphere
#> Brain_-_Caudate_(basal_ganglia)
#> Brain_-_Anterior_cingulate_cortex_(BA24)
#> Brain_-_Amygdala

# Task 5
echo "exercici 5"
#esten en bashhandson
wget https://github.com/dgarrimar/teaching/raw/master/uvic/AdvBI_2018/data/hands-on/bash/scripts.tar.gz
gzip -d scripts.tar.gz
tar -xvf scripts.tar
# wget hem descarregat el arxiu que estava comprimit x gz i tar
# i l'hem descomprimit ab gzip i tar, per descomprimir gzip s'ecriu "gzip -d"
mv usage.sh bin
# movem fitxer usage.sh cap a carpeta bin
echo 'echo "The script $0 has received the argument $1"' >> bin/usage.sh
# concatenem el arxiu descarregat sol del usage.sh i li afegim la nostre modificacio amb la comanda echo q es veure.ho pq ho guardi dins de aquest fitxer descarregat sense la modificacio.
chmod 777 bin/usage.sh
#estem modifican els permisos, i amb el 777 els hi donem tots.
export PATH=$PATH:/home/sara/bash_HandsOn/bin
# export es afegir. i path es una variable path es del core de linux, xtant tot lo que afegim a la variable ho podrem executar desde qualsevol lloc pq esta dintre del core de linux.
#afegim el link aquest en el path
usage.sh ACTG
#executem funcio usage.sh
echo "DONE"

# Task 6
echo "exercici 6"

wget  https://github.com/dgarrimar/teaching/raw/master/uvic/AdvBI_2018/data/hands-on/bash/unknown.samples.tsv 
mv unknown.samples.tsv input
#(input/input.tsv)
# amb sort indicarem el ordre que volem
sort -k1,1 input/input.tsv > input/ordinput
mv input/ordinput input/input.tsv
sort -k1,1 input/unknown.samples.tsv > input/ordunknown
mv input/ordunknown input/unknown.samples.tsv
#para poder usar el join antes tienen que estar ordenados
join -t $'\t' -1 1 -2 1 input/unknown.samples.tsv input/input.tsv > input/joint.tsv
# Es a dir aqui unim els dos arxius a travès de una mateixa columna idèntica que contenen que es el GTEX
# A travès de la columna GTEX unim els 2 arxius
#1r arxiu  (-1) "unknowm.s" GTEX en (1)1r columna + 2n arxiu input.tsv te el GTEX a la 1ra columna tb aixi doncs posem posicio -2 1 (2n arxiu) (1ra columna)
awk '{print $3, $2, $1}' input/joint.tsv > input/rjoint.tsv #farà com un for
# orden inverso lo hacemos con awk (otro idioma dif del bash) 
# no hacemso el orden con sort pq sort no hace inverso de columnas
sed 's/_/ /g' input/rjoint.tsv > input/joint.tsv 
#sustituimos "_" por " "(espacio) 
cat joint.tsv
echo "DONE"


# Task 7

echo "TASK 7"

echo 'if [ $1 ]
then
for i in {1..5}
do
	echo "The script $0 has received the argument $1"
done
else
echo "No argument provided"
fi' >> bin/usage.sh

echo "DONE"
