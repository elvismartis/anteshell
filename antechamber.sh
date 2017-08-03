#!/bin/bash
echo "Anteshell v1.0 is a script to automate small molecule parameter building for AMBER."
# The entire code is written in Bourne Shell.
# Copyright (c) 2017 [Elvis Martis]
# Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "GMXSTARK v1.0"), to deal
# in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
# OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
# IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
# TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE
# The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
# All bug reports and suggestions can be sent to elvis.martis@bcp.edu.in with subject line "GMXSTARK v1.0 bug report"
# If the use of this script results in a publication, kindly acknowledge the use for the sake promotion of this code
# Acknowledgement may be written as "The Authors acknowledge the use of "Anteshell v1.0" for generating the input files"
echo "This script will run antechamber and parmchk"
echo "Please report any bug at elvis_bcp@elvismartis.in or elvis.martis@bcp.edu.in"
read -p "Enter you working directory [Enter the full path for example /home/user/....]: " Wor_dir
cd $Wor_dir
echo $pwd
source $AMBERHOME/amber.sh
read -p "Please enter the name of your input file: "  imol2
read -p "Enter the name of the out file: "  omol2
read -p "Enter  your input format [mol2 or pdb or gout for G09 outfile] : " ifor
read -p "Enter your output format [mol2 or pdb or prepin for G09 optimized molecule] : " ofor
read -p "Enter the verbosity [type 0 (no),1 (short) or 2 (Full)]: " ver
read -p "Enter the net charge on the molecule [Please double check, don't blame Antechamber for your mess] : " chr
read -p "Enter charge fitting method [bcc or resp only for G09 input] : " amchr
read -p "Enter the desired atom_type [default is gaff] : " atmty
read -p "Enter three letter residue code you wish [in capitals] : " resnm
echo "Hope you have double check Everything"
antechamber -i ${imol2}.$ifor \
	    -o ${omol2}_out.$ofor \
	    -fi $ifor \
            -fo $ofor \
            -s $ver \
            -nc $chr \
	    -c $amchr \
	    -at $atmty \
            -rn $resnm && 
parmchk -i ${omol2}_out.$ofor \
	-f $ofor \
        -o ${omol2}_out.frcmod
ls *.frcmod
echo "Experience is what you get when you didn't get what you wanted. — Wanda"
exit

