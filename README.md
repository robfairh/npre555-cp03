# npre555-cp03

This repository contains the following files necessary for reproducing this work:

# P3Moltres

* contains the .h and .c files necessary to build the MOOSE-based application
* having either MOOSE or MOLTRES installed is a requirement for building this app
* in my case, my ```~/.bashrc``` file defines the path to moltres directory called ```$MOLTRES```
* build application by running: ```make -j4```

# sp3-diffusion

* contains the input files necessary for running the one-dimensional test cases.
* to create the 3 group cross-section files for the SP3 solver run: ```bash create-xs-sp3.sh```
* to run SP3 input files do: ```../P3Moltres/p3moltres-opt -i <inputfile>```
* to create the 3 group cross-section files for the diffusion solver run: ```bash create-xs-diff.sh```
* to run Moltres input files do: ```$MOLTRES/moltres-opt -i <inputfile>```
* to plot results run: ```python postprocessing.py```

# C5G2-benchmark

* contains the input files necessary for running the two-dimensional test case.
* to create the cross-section files run: ```mkdir xs2g; mkdir xs2g-homo; python constants.py```
* to produce the ```.msh``` file open ```2D.geo``` with ```gmsh``` and generate 2D mesh
* to run SP3 input files do: ```../P3Moltres/p3moltres-opt -i <inputfile>```
* to plot results run: ```python postprocessing.py```

# report

* report.tex uses images located in other locations of this repository
* this folder contains all the rest of the necessary files for building the .pdf of the report
* the .pdf is included in this folder

# presentation

* pres.tex uses images located in other locations of this repository
* this folder contains all the rest of the necessary files for building the .pdf of the presentation
* the .pdf is included in this folder
