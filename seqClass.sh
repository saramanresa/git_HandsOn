#!/bin/bash
seq=$1
seq=$(echo $seq | tr a-z A-Z)  # Note we just added this line
if [[ $seq =~ ^[ACGTU]+$ ]]; then
  if [[ $seq =~ ^[ACGT]+$ ]]; then
	echo "The sequence is DNA"
  if [[ $seq =~ ^[ACGU]+$ ]]; then
	echo "The sequence is RNA"
else
  echo "The sequence is not DNA nor RNA"
fi

#edit 
	


