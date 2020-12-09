# Bottom-Up-CG-V6K2


This code has been developed by Akash Banerjee in the Dr. Meenakshi Dutt laboratory at Rutgers University. 

**Project Duration**: September 2018 to December 2020

**Modeled System**: Self-assemble of V6K2 peptides into a Nanorod. 

**Approach**: Bottom-up Coarse-Graining (CG) - where all potentials are developed by using all atom (AA) simulations as reference. 

**General Method for CG model development**: The Iterative Boltzmann Inversion (IBI) and Force Matching (FM) methods are applied to resolve CG potentials. 

## Software packages used for implementation: 

1. GROMACS for Molecular Dynamics Simulations (AA and CG). [http://www.gromacs.org/]
2. VOTCA for CG model building and development of CG potentials. [https://www.votca.org/csg-manual/index.html]

## AA Models and Force Fields:

1. The Amber99SB force field is used to run all AA simulations. [https://ambermd.org/AmberModels.php]
2. The Amber LEaP tool is used to build the initial AA peptide configuration. [http://ambermd.org/tutorials/pengfei/index.htm]
3. The SPC/E water model is used to solvate peptide systems. 

## Instructions for Running Self-Assembly Simulations in CG representation: 

1. Go to Nanorod_Simulations ->simulation.bash
2. You will need a GROAMCS executable to run this simulation. Please enter the path for the executable in the appropriate location. 
3. Run the script using: ./simulation.bash
4. The bash file will run the simulation for 1ns (may take around 5 hours on a regular Desktop computer). 
5. A file called as output-CG.gro would be dumped at the end of the simulation. You can visualize this file using VMD [https://www.ks.uiuc.edu/Research/vmd/] or any other visulation software of your choice.
6. In VMD, you will be able to see that the peptides are beginning to self-assemble into a nanorod. 
6. In order to get stable nanorods, please run the simulation for an additional 4 ns. (This can be done by changing the number of MD steps in the grompp_CG.mdp file)

### Additional Notes 

1. All potentials are located in Nanorod_Simulations->Pots
2. For some versions of GROMACS, you may need to change certain features in the MDP file. 
3. You can hike the timestep after initial equilibration for faster self-assembly. 

### Compilation Notes: 

We have reproduced our results (formation of nanorod+ associated analysis) in following computational resources: 

1. Stampede2 super computer provided by XSEDE (1 node that has 64 cores) [https://portal.xsede.org/tacc-stampede2]
2. Desktop computer (8 MPI threads)
3. GROMACS versions: 5.1.2 and 2018.3 

Please note that for any other combination, you may need to change simulation parameters. (Specifically, in the MDP file)






