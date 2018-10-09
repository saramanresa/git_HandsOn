#!/bin/bash

mkdir git_HandsOn
cd git_HandsOn
echo '#!/bin/bash
seq=$1
if [[ $seq =~ ^[ACGTU]+$ ]]; then
  if [[ $seq =~ T ]]; then
    echo "The sequence is DNA"
  elif [[ $seq =~ U ]]; then
    echo "The sequence is RNA"
  else
    echo "The sequence can be DNA or RNA"
  if
else
  echo "The sequence is not DNA nor RNA"
fi' > seqClass.sh

chmod +x seqClass.sh

#inicialitzar el git
git init

#veure quins fitxers no estan commitejats
git status

#afegim el fitxer que volem pujar al git
git add seqClass.sh

#afegim el fitxer README, fem commit i el pujem al git
git add README.md
git commit -m "adding readme file"
git push


