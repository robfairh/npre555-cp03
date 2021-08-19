# npre555-cp03

This repository contains the following files necessary for reproducing this work:

## P3Moltres

* contains the .h and .c files necessary to build the MOOSE-based application
* having either MOOSE or MOLTRES installed is a requirement for building this app
* in my case, my ```~/.bashrc``` file defines the path to moltres directory called ```$MOLTRES```
* build application by running: ```make -j4```


## sp3-diffusion

* contains the input files necessary for running a one-dimensional test case
* to run everything and obtain the results run: ```bash runfiles.sh```


## C5G2-capilla

* contains the input files necessary for running a two-dimensional test case
* to run everything and obtain the results run: ```bash runfiles.sh```


## brantley-larsen-2d

* contains the input files necessary for running a two-dimensional test case
* to run everything and obtain the results run: ```bash runfiles.sh```


## C5G2-original

* contains the input files necessary for running a two-dimensional test case
* to run everything and obtain the results run: ```bash runfiles.sh```


## C5G2-brantley

* contains the input files necessary for running a two-dimensional test case
* to run everything and obtain the results run: ```bash runfiles.sh```


## C5G2-3D

* contains the input files necessary for running a three-dimensional test case
* to run everything and obtain the results run: ```bash runfiles.sh```
* to make figures ```geo-xz.png``` and ```geo-xy.png``` create mesh for ```3D-mesh.geo```, run ```bash ../scripts/convertmshtoexodus.sh 3D-mesh.msh``` and obtain the figure from ```temp_in.e```
* to obtain the self-scattering cross-sections run ```python selfscatt.py```


## C5G7-3D

* contains the input files necessary for running a three-dimensional test case
* to run everything run: ```bash runfiles.sh```
* it is too big and uses too much memory, I couldn't run it


## scripts

* contains diferent useful scripts


## pubs/

Contains the necessary files for building the .pdf of the following publications:
* report-555
* presentation-555
* summary-studentconf-2021
* summary-ans-annual-2021


## things left to do

* sp3-diffusion/extract-convert.py could use some work
* sp3-diffusion/ C5G2-capilla/ and brantley-larsen-2d/ have similar post processing functions that could be unified.
* same for constants.py. use constants.py from 'C5G7-benchmark'

## Future work

* Add Jacobians to SP3 solver
* Update materials with only the information necessary, for ex: remove beta
* Add AuxVar: flux_g ??
* See about anisotropic P3 and time dependent

