#!bin/bash
#
#
#
mkdir -p ./tmp/SignalP_result

perl ./bin/signalp/4.1/signalp -f short -n ./tmp/SignalP_result/secreted_proteins.gff3 -t euk ./tmp/outfiles/LengthCysproteins.fasta  > ./tmp/SignalP_result/signal.gff3

cut -f1 ./tmp/SignalP_result/secreted_proteins.gff3 | sed 's/^##.*/-/g' | sed 's/^/>/g' > ./tmp/SignalP_result/idwithSP.fasta

perl ./scripts/signaljob.pl

mkdir -p ./tmp/Phobius_result

perl ./bin/phobius/1.01/phobius.pl -short ./tmp/SignalP_result/secretomSP.fasta > ./tmp/Phobius_result/resultPhobius.fasta 
cat ./tmp/Phobius_result/resultPhobius.fasta | grep '  0  Y' | cut -d' ' -f1| sed 's/^/>/g' > ./tmp/Phobius_result/idwithspPhobius.fasta

perl ./scripts/phobiusjob.pl
