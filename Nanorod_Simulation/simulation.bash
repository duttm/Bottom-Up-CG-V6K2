#!/bin/bash

#We have run this simulation on the following GROMACS versions : GROMACS 5.1.2 and 2018.3
#The simulation has been tested on the following machines: 
#1. Stampede2 (1 node that has 64 cores) : The peptides begin to assemble into a nanorod after a 1 ns simulation. An addtional 4 ns simulation stabilizes the nanorod.   
# link to stampede2: https://portal.xsede.org/tacc-stampede2
#2. Local desktop computer (runs on 8 threads) : The peptide assembly behavior approximately the same as above. 


#Please note that the MDP file may need to be changed if :
#1. You are using a different version of GROMACS
#2. A different machine (may need to change timestep)
#3. Any other possible configuration other than the ones this simulation has been tested on.

exp_grompp=gmx # Please enter the gromacs executable here 

input=input_CG-Mapped # Name of the input file, i.e. the CG coordinates Mapped onto the AA system

GRO="${input}.gro"

tpr=table
minim=grompp_CG # the default run time is set to 1ns in this file (grompp_CG.mdp). The simulation needs to run for longer to stablize the nanorod.  
TOP=topol_CG.top
NDX=index_CG.ndx


DIR=$PWD

cp ./pots/table_*.xvg $DIR

$exp_grompp grompp -f "${minim}.mdp" -c $GRO -o $tpr -p  $TOP -n $NDX 


# Please note that different version of GROMACS interpret tabulated potentials in various formats.

## For Gromacs 2018.3, use the following: 


$exp_grompp mdrun  -deffnm $tpr -v -tableb table_b1.xvg table_b2.xvg table_b3420.xvg table_b5.xvg table_b6420.xvg table_b7.xvg table_b201.xvg table_b202420.xvg table_b8.xvg table_a1420.xvg table_a2420.xvg table_a3420.xvg table_a4420.xvg table_a5420.xvg table_a6420.xvg table_a8420.xvg table_a10420.xvg table_a205420.xvg table_a201420.xvg table_a202420.xvg table_a10420.xvg table_a9420.xvg table_a14420.xvg table_a15420.xvg  table_a208420.xvg  table_b310420.xvg  table_b311420.xvg  table_d1.xvg table_d2.xvg table_d202.xvg 

## For Gromacs 5.1.2, use the following (uncomment the following line and comment out the above line):

##$exp_grompp mdrun  -deffnm $tpr -v 



rm table_*.xvg 

mv table.gro output-CG.gro









