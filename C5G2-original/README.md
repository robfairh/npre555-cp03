This study is based on:

[1] Cavarec, Perron, Verwaerde, West. Benchmark Calculations of Power Distribution within Assemblies. 1994.
[2] Capilla et al. Applications of the multidimensional equations to complex fuel assembly problems. 2009.

# Files:

* 2D-power.geo: each fuel pin is a subdomain
* input-power.i: each fuel pin is a subdomain. It doesn't use the transport correction
* input-power-correct.i: each fuel pin is a subdomain. Cross-sections use the transport correction
* input-moltres.i: each fuel pin is a subdomain


# Results:

* Reference results for transport codes (I believe they apply the diag tr correction) (p. 35): 0.93755 +/- 0.00080
* input-power.i: my results without transport correction: keff = 9.71059145e-01 (to compare against capilla [2] reference value)
* input-power-correct.i: my result with transport correction (using diffusion coefficient specified in [1]): keff = 0.9379242898, delta_rho = 43 pcm
* pin power distribution max errors: 
	- uo2a max [%]:  1.0219108386516425
	- uo2b max [%]:  1.5337116179325023
	- mox max [%]:  1.878521307990952

* Reference result for diffusion codes: 0.93796 
* keff calculated w/ Moltres: 0.9381899730
* delta_rho_to transport keff = 73 pcm
* delta_rho_to diff keff = 57 pcm
* pin power distribution max errors: 
	- uo2a max [%]:  0.3689718204531673
	- uo2b max [%]:  0.7686613069926933
	- mox max [%]:  0.8008475544698083
