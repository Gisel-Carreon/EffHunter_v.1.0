#!/bin/bash 
# Welcome!
#
# EffHunter_1.0 predictor
#
# Edit this script to suit your installation needs.
# This program is distributed in the hope that it will be useful,
#
#
#BCC
#blondy.canto@cicy.mx
#
#KGCA
#karla.carreon@cicy.mx; carreon.gisel@gmail.com

	
if sh ./scripts/bin/LOGO/logo.sh

echo "Indicate the next parameters
minlen maxlen path/to/file #cysteins"; then sh ./scripts/lengthfilter.sh

else 
	printf "No parameters provided"; exit
fi


#Secretion proteins analysis--prediction by SignalP server and #Phobius
#Execute Phobius analysis
#
#
sh ./scripts/secretionfilter.sh


#Execute the TMHMM analysis
#
#
sh ./scripts/transmembranal-job.sh 


#Execute Wolfpsort Analysis 'for' subcellular localization
#
#
sh ./scripts/localization-pred.sh

#Making effector proteins database
#
perl ./scripts/huntingJob.pl 


echo -------------------------- Finished analysis-----------------------------


