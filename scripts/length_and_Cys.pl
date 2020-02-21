#!/usr/bin/env perl
#

use Carp;
use Pod::Usage;
use Getopt::Long;
use Bio::SeqIO;
use Bio::Seq;
use strict;
use warnings;

##################################################################
my $Dir = qx(mkdir ./tmp/outfiles);
open A, ">./tmp/outfiles/output_length.fasta";

#print qq (put the lenght limits min max <archive.fasta>\t); <STDIN>;
my $minlen= shift or die "Error: `minlen` parameter not provided\n";
my $maxlen= shift or die "Error: `maxlen`parameter not provided\n";
$ARGV[0] or die;
my$y= shift @ARGV;
open Y, "$y" or die; 

{
local $/=">";

while (<Y>) {
chomp;
next unless /\w/;

s/>$//gs;

my@seq= split/\n/;
my$header= shift @seq;
my$seqlen = length join "", @seq;

print A ">$_" if ($seqlen >= $minlen and $seqlen <= $maxlen);

#print C qq (>$_);


}#while

local $/="\n";

}

####################################

open A,"./tmp/outfiles/output_length.fasta";
open B, ">./tmp/outfiles/outfile_cys.fasta";
my$head='';
my$flag=0; 
my$seq='';
while (my$line = <A>) {
	#print qq ($line\n);<STDIN>;
	chomp($line);
	if ($line=~m/>/ and $flag ==0) {
		$head= $line;
	}#fi

	elsif ($line=~m/>/ and $flag >=1) {
	my$contar=&contar($head, $seq);
	print B qq ($head\t$contar\n);
		$flag= 0;
		$head= $line;
		$seq='';
	}#elsif

	else {
		$seq.=$line."";
		$flag++;
	}#else

}#while

my$contar=&contar ($head,$seq);
print B qq ($head\t$contar\n);
############
sub contar {
	my$enca=$_[0];
	my$secu=$_[1];
	my$conta=0;
	my@array=split//, $secu;
	foreach my$aa (@array) {
		if ($aa eq 'C') {
			$conta++;
		}#fi
	}#foreach
return ($conta);
}#contar

###########
my $number= shift or die "Error: 'number of residue' parameter not provided\n";

open B, "./tmp/outfiles/outfile_cys.fasta";
open C, ">./tmp/outfiles/filtro_cys.txt";
open W, ">./tmp/outfiles/IDs.fasta";

while (my$li=<B>) {
	chomp($li);
	my ($ID, $C) = split/\t/, $li;
	if( $C >=$number) { 
		print C qq ($ID\t$C\n);
		print W qq ($ID\n);
	}#fi
}#while



#####################################################################
