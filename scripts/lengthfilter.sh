#!/bin/bash

read minlen maxlen path_to_file;
	perl ./scripts/length_and_Cys.pl $minlen $maxlen $path_to_file;
		perl ./scripts/length_cysteinejob.pl
