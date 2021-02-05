
This study is based on:

[1] Cavarec, Perron, Verwaerde, West. Benchmark Calculations of Power Distribution within Assemblies. 1994.


# Files:

* 2D.geo: 2D geometry of the benchmark
* 2D-power.geo: each fuel pin is a subdomain
* input-2g-het.i: each material is a subdomain
* input-2g-power.i: each fuel pin is a subdomain
* input-moltres.i: each fuel pin is a subdomain


# Results:

* Reference results for transport codes (I believe they apply the diag tr correction) (p. 35): 0.93755 +/- 0.00080
* my result (using diffusion coefficient specified in [1]): keff = 0.9379242898, delta_rho = 43 pcm
* pin power distribution max errors: 
	- uo2a max [%]:  
	- uo2b max [%]:  
	- mox max [%]:  

* Reference result for diffusion codes: 0.93796 
* keff calculated w/ Moltres: 0.9381899730
* delta_rho_to transport keff = 73 pcm
* delta_rho_to diff keff = 57 pcm
* pin power distribution max errors: 
	- uo2a max [%]:  0.36897182045319704
	- uo2b max [%]:  0.7686613069926476
	- mox max [%]:  0.8008475544697691
