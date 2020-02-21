EffHunter version 1.0
(2019) Karla Carreón, Julio Vega, Luis Sáenz, Ignacio Islas, Blondy Canto.
Correspondance: cantocanche@cicy.mx
     ******   PLEASE DO NOT REDISTRIBUTE THE PACKAGE   ******

				
			INSTALLATION INSCRUCTIONS


DESCRIPTION

EffHunter produces ab initio predictions of canonical effectors proteins using
a total proteome.The method uses a several criteria like a protein length, 
cysteine content, prediction of a secretion signal peptide and transmembranal
domains.


PREREQUISITES
Unix/Linux
Perl 5.6 or later
    

PRE-INSTALLATION

EffHunter 1.0 is available for Linux. The standard UNIX tools perl, gawk
(or nawk etc.), [t]csh, paste and sed must be available on the system.

EffHunter 1.0  launches several other softwares and parses their output
before the actual predictions can be made. If those softwares are not on
the system already they will have to be installed before installation of
EffHunter 1.0 is attempted. The softwares are as follows:
	

	Phobius		http://phobius.sbc.su.se/
			"Advantages of combined transmembrane topology and 
			signal peptide prediction--the Phobius web server".
			Nucleic Acids Res., 35:W429-32, July 2007
			Lukas Kall, Anders Krogh, Erik Sonnhammer.
			contact lukall@u.washington.edu

	SignalP 4.1	http://www.cbs.dtu.dk/services/SignalP/
			"SignalP 4.0: discriminating signal peptides from 
			transmembrane regions".Nature Methods, 8:785-786 (2011).
			Thomas Nordahl Petersen,Søren Brunak, Gunnar von 
			Heijne and Henrik Nielsen.			
			contact software@cbs.dtu.dk
			
	TMHMM 2.0	http://www.cbs.dtu.dk/services/TMHMM/
			"Predicting transmembrane protein topology with a
			hidden Markov model: Application to complete genomes".
			Journal of Molecular Biology, 305(3):567-580, January 2001.			
			A. Krogh, B. Larsson, G. von Heijne, and E. L. L. Sonnhammer.			
			contact software@cbs.dtu.dk
	
	WoLFPSORT	https://wolfpsort.hgc.jp/
			"WoLF PSORT: protein localization predictor". 
			Nucleic Acids Res. 2007 Jul;35(Web Server issue):W585-7.
			Horton P, Park KJ, Obayashi T, Fujita N, Harada H, Adams-Collier 
			CJ, Nakai K. 
			contact pj.ca.oykot-u.smi@iakank
			
Please, install each program into the fallowing directory paths:

Phobius	=	path/to/EffHunter/bin/phobius/1.01
SignalP	=	path/to/EffHunter/bin/signalp/4.1
TMHMM	=	path/to/EffHunter/bin/tmhmm/2.0c
WoLFPSORT=	path/to/EffHunter/bin/WoLFPSORT-master
   	

INSTALL
Change current directory to the directory where you want to install EffHunter 1.0
(e.g. /usr/local/share/), and unpack the tar file with the command:

	tar xvf EffHunter_1.0.tar.gz
	cd EffHunter_1.0


PERMISSIONS
To run EffHunter 1.0 you should type the next command:
	chmod 755


RUN EffHunter 1.0
To use the EffHunter 1.0 predictor, you need to type the fallowing command in the directory
	./EffHunter.sh

Next, you must indicate de fallowing command options:
minimal length 		= This number indicate equal to or more than N number of amino acids
maximal length		= This number indicate equal to or less than N number of amino acids
path/to/fasta/file	= This indicate the path to protein fasta file for EffHunter work 
number of cysteine	= This number indicate equal to o more than N of cysteine residues 

	   minlen maxlen path/to/file #cysteine

	(e.g. 30 300 /usr/bin/share/protein.fasta 2)
	      ^   ^             ^                 ^
 
The example indicate proteins more than 30 amino acids and less than 300 amino acids
in the fasta file "protein.fasta" and proteins with equal or more 2 cysteine residues.




