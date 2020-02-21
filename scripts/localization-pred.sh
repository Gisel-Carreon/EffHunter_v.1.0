#!/bin/bash
##run WoLFPSORT for eukarya proteins
mkdir -p ./tmp/WoLFPsort_result
./bin/wolfpsort/WoLFPSort-master/bin/runWolfPsortSummary fungi < ./tmp/TMHMM_results/secretome.woTM.fasta > ./tmp/WoLFPsort_result/wolfpsort.txt
