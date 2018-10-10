#!/bin/bash
seq=$1 # la sequencia entrada se guarda en la variable seq
seq=$(echo $seq | tr a-z A-Z)  # Note we just added this line
if [[ $seq =~ ^[ACGTU]+$ ]]; then # si contiene algunos de los valors ACGTU entra
 if [[ $seq =~ T ]]; then # si tiene T entra
  if [[ $seq =~ U ]]; then # si contiene T i U entra
	echo "The sequence is not DNA nor RNA" # muestra el mensaje 
 else # si no tiene U entra
	echo "The sequence is DNA" #mensaje que nos mostrará
  fi
elif [[ $seq =~ U ]]; then # si contiene una U entra
   echo "The sequence is RNA" #muestra el mensaje de que es RNA
 else #entonces, si sequencia no contiene T ni U, entra dentro.
  echo "The sequence can be RNA or DNA" # nos proyecta el mensaje
 fi
else # si no contiene ninguno de los valores anteriores, entra dentro
 echo "The sequence is not DNA nor RNA" # print message
fi #termina 
	


