
This study is based on:

Cavarec, Perron, Verwaerde, West. Benchmark Calculations of Power Distribution within Assemblies. 1994.


# Results:

* Reference results (I believe they apply the diag tr correction) (p. 35): 0.93755 +/- 0.00080
* Normal method result: keff = 9.71059145e-01
* Applying diagonal transport correction result: (in input-2g-hetB.csv) keff = 0.9380140803, delta_rho = 53 pcm.
* using diffusion coefficient specified in Cavarec: keff = 0.9379242898, delta_rho = 43 pcm.

0.9379242898
0.9379242898

# Geometry files:

* mesh1.geo: 2D geometry of the benchmark
* mesh1B.geo: 2D full geometry of the benchmark
* mesh2.geo: UO2 fuel assembly
* mesh3.geo: MOX fuel assembly

# Reproducing the results

* to create the cross-sections: run ```python constants.py```
* open ```2D.geo``` with ```gmsh``` and create .msh file
* run ```python postprocessing.py```
