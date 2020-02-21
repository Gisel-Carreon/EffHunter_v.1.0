#!/bin/bash

mkdir -p ./tmp/TMHMM_results
cat ./tmp/Phobius_result/secretomPhobius.fasta  | ./bin/tmhmm/2.0c/decodeanhmm.Linux_x86_64 -f ./bin/tmhmm/2.0c/TMHMM2.0.options -modelfile ./bin/tmhmm/2.0c/TMHMM2.0c.model > ./tmp/TMHMM_results/tmhmm.gff3
	
perl ./bin/tmhmm/2.0c/tmhmmformat.pl ./tmp/TMHMM_results/tmhmm.gff3 > ./tmp/TMHMM_results/res.gff3

grep -E "Number of predicted TMHs:  0" ./tmp/TMHMM_results/res.gff3| sed 's/# />/g' > ./tmp/TMHMM_results/IDtmhmm.txt
cut -d' ' -f1 ./tmp/TMHMM_results/IDtmhmm.txt > ./tmp/TMHMM_results/id.wotransmembrandomains.fasta

perl ./scripts/tmhmmjob.pl
