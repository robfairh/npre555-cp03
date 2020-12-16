# npre555-cp03

This repository contains the following files necessary for reproducing this work:

# P3Moltres

* contains the .h and .c files necessary to build the MOOSE-based application.
* having either MOOSE or MOLTRES installed is a requirement for building this app
* in my case, my ~/.bashrc file defines the path to moltres directory called $MOLTRES
* build application by running: make -j4


# sp3-diffusion

* contains the input files necessary for running the one-dimensional test cases.
* to run SP3 input files do: ../P3Moltres/p3moltres-opt -i <inputfile>
* to run Moltres input files do: $MOLTRES/moltres-opt -i <inputfile>
* to plot results run: python postprocessing.py

# C5G2-benchmark

* contains the input files necessary for running the two-dimensional test case.


# report

* report.tex uses images located in other locations of this repository
* this folder contains all the rest of the necessary files for building the .pdf of the report
* the .pdf is included in this folder

# presentation

* pres.tex uses images located in other locations of this repository
* this folder contains all the rest of the necessary files for building the .pdf of the presentation
* the .pdf is included in this folder
