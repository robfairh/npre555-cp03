input files:
------------

input-1g-fixed.i
- Moltres diffusion kernels
- 1 group
- Fixed source
- xmax = 50

input-diff.i
- Moltres diffusion kernels to solve P3
- 2 group (flux0 and flux2)
- Fixed source

input-1g-crit.i
- Moltres diffusion kernels
- 1 group
- Criticality source
- xmax = 200
- keff = 1.05278137e+00

input-3g-fixed.i:
- Moltres diffusion kernels
- 3 group
- Fixed source
- xmax = 50

input-3g-crit.i:
- Moltres diffusion kernels
- 3 group
- Criticality source
- xmax = 300, nx = 500
- keff = 1.02877615e+00

input-3g-crit1.i:
- Moltres diffusion kernels
- 3 group
- Criticality source
- xmax = 793, nx = 500
- keff = 1.06527761e+00

input-3g-crit2.i:
- Moltres diffusion kernels
- 3 group
- Criticality source
- adds bottom and top reflectors
- keff = 1.07344588e+00
