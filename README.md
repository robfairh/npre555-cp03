# npre555-cp03

This repository contains the following files necessary for reproducing this work:

## P3Moltres

* contains the .h and .c files necessary to build the MOOSE-based application
* having either MOOSE or MOLTRES installed is a requirement for building this app
* in my case, my ```~/.bashrc``` file defines the path to moltres directory called ```$MOLTRES```
* build application by running: ```make -j4```


## sp3-diffusion

* contains the input files necessary for running the one-dimensional test cases
* to produce the ```.msh``` file only run: ```gmsh -1 -o 1D-fuel-reflec.msh 1D-fuel-reflec.geo```
* to create the cross-section files only for the SP3 solver and moltres run: ```python constants.py```
* to run SP3 input files only do: ```../P3Moltres/p3moltres-opt -i <inputfile>```
* to run Moltres input files only do: ```$MOLTRES/moltres-opt -i <inputfile>```
* to plot the results run: ```python postprocessing.py```
* the script ```extract-convert.py``` could use some work


## C5G2-capilla

* contains the input files necessary for running the two-dimensional test case.
* to run everything and obtain the results run: ```bash runfiles.sh```
* to produce the ```.msh``` file only run: ```gmsh -2 -o 2D.msh 2D.geo```
* to create the cross-section files only run: ```python constants.py```
* to run SP3 input files only do: ```../P3Moltres/p3moltres-opt -i <inputfile>```
* to plot results run: ```python postprocessing.py```


## brantley-larsen-2d

* contains the input files necessary for running the two-dimensional test case.
* to run everything and obtain the results run: ```bash runfiles.sh```
* to produce the ```.msh``` file only run: ```gmsh -2 -o bl-2d-simple.msh bl-2d-simple.geo```
* make cross-section files by running ```python constants.py```
* to run SP3 input files only do: ```../P3Moltres/p3moltres-opt -i <inputfile>```
* to plot results run: ```python postprocessing.py```



## C5G2-original

* contains the input files necessary for running the two-dimensional test case.
* to create the cross-section files run: ``` python constants.py ```
* to produce the ```.msh``` file open ```2D.geo``` with ```gmsh``` and generate the 2D mesh
* to run SP3 input files do: ```../P3Moltres/p3moltres-opt -i <inputfile>```
* to plot results run: ```python postprocessing.py```


## scripts

* contains diferent useful scripts


## pubs/

Contains the necessary files for building the .pdf of the following publications:
* report-555/
* presentation-555/
* summary-studentconf-2021
* summary-ans-annual-2021


## things left to do

* sp3-diffusion/ C5G2-capilla/ and brantley-larsen-2d/ have similar post processing functions that could be unified.
* same with constants.py
