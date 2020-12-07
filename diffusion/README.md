input files:
------------

input-1g-fixed.i
- Moltres diffusion kernels
- 1 group
- Fixed source

input-diff.i
- Moltres diffusion kernels to solve P3
- 2 group (flux0 and flux2)
- Fixed source

input-1g-crit.i
- Moltres diffusion kernels
- 1 group
- Criticality source
- xmax = 200
- keff = 1.052780e+00

input-3g-fixed.i:
- Moltres diffusion kernels
- 3 group
- Fixed source
- xmax = 50

input-3g-crit.i:
- Moltres diffusion kernels
- 3 group
- Criticality source
- xmax = 250, nx = 500
- keff = 1.01058340e+00

input2.i
- Moltres diffusion kernels
- 3 group
- Criticality source
- xmax = 793, nx = 500
- keff = 1.065277e+00

input3.i
- Moltres diffusion kernels
- 3 group
- Criticality source
- adds bottom and top reflectors
- keff = 1.073377e+00
