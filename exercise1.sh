##!/bin/bash
wget https://github.com/dgarrimar/teaching/raw/master/uvic/AdvBI_2018/data/exercises/bash/TAIR9_mRNA.bed
cat TAIR9_mRNA.bed
#Take a look at TAIR9_mRNA.bed, which command would you use for that? If you compress it, which command could you use to look at its content?
# " gzip TAIR9_mRNA.bed "
# Pero NO está comprimido, si lo estuviera no podriamos abrir el fichero.

# Ahora con grep decimos que queremos buscar los que sean chr1 y que además sean positivos
wc <(grep + <(grep chr1 TAIR9_mRNA.bed)) # con wc contamos cuantas lineas tienen + y son chr1

# separamos bien el fichero y obtenemos la grandaria de los primeros genes
awk '{print$lastfield}' <(sed '-s/,/ /g' <(head -n 10 <(awk '{print$11}' TAIR9_mRNA.bed)))
# amb el sort li diem el que volem ordenar
awk '{print$11}' TAIR9_mRNA.bed
head -n 10 TAIR9_mRNA.bed
sed 's/,/ /g' TAIR9_mRNA.bed
awk '{print$lastfield}' TAIR9_mRNA.bed

#Para obtener la longitud de los diez exones más largos en el cromosoma 1
grep chr1 TAIR9_mRNA.bed | awk '{print$11}' | tr , "\n" | sort -nr | head


# Ara llegim, imprimim les entrades del arxiu no duplicades amb uniq, ordenem amb sort dient-li quin ordre necessitem.

cat TAIR9_mRNA.bed | awk '{print$4"\t"$10}' TAIR9_mRNA.bed | sort -nr -k2,2 | uniq | head


