#!/bin/bash
message="spliter"
compiler=gcc
commonFlags="-D _GNU_SOURCE -Ofast -fopenmp -march=native"
novecFlags="-fno-tree-vectorize -fno-tree-slp-vectorize"
pox=.c
echo
echo $message>>fileForSpeedups
echo "Time: $(date)">>fileForSpeedups
echo $compiler >>fileForSpeedups
echo $commonFlags>>fileForSpeedups
echo $novecFlags>>fileForSpeedups
echo "*****************************************GCC*****************************************" 
file="IMP1"
echo
echo "Out put for $file scalar:"
$compiler $commonFlags $novecFlags   $file$pox -o $file$cmp && ./$file$cmp
echo
file="IMP1"
echo "******************************"
echo "Out put for $file CAV:"
$compiler $commonFlags $file$pox -o $file$cmp && ./$file$cmp
echo
echo "******************************"
file="IMP2"
echo "Out put for $file SSE2:"
$compiler $commonFlags $novecFlags $file$pox -o $file$cmp && ./$file$cmp
echo
echo "******************************"
file="IMP3"
echo "Out put for $file AVX2:"
$compiler $commonFlags $novecFlags   $file$pox -o $file$cmp && ./$file$cmp
echo
echo "******************************"
