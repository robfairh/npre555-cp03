# Geometries

1D-fuel-reflec.geo:
- Comprises an active core region with top and bottom reflectors


# SP3 input files:

sp3-1g-fixed.i:
- P3moltres4 kernels
- 1 group
- Fixed source
- xmax = 50

sp3-1g-crit.i:
- P3moltres4 kernels
- 1 group
- Criticality source
- xmax = 200
- keff = 1.06003541e+00

sp3-3g-fixed.i:
- P3moltres4 kernels
- 3 group
- Fixed source
- xmax = 50

sp3-3g-crit.i:
- P3moltre4 kernels
- 3 group
- Criticality source
- xmax = 300, nx = 500
- keff = 1.03004681e+00

sp3-3g-crit1.i:
- P3moltre4 kernels
- 3 group
- Criticality source
- xmax = 793, nx = 500
- keff = 1.06551447e+00

sp3-3g-crit2.i:
- P3 kernels
- 3 group
- Criticality source
- adds bottom and top reflectors
- keff = 1.07342236e+00


# Moltres input files:

diff-1g-fixed.i
- Moltres diffusion kernels
- 1 group
- Fixed source
- xmax = 50

diff-diff.i
- Moltres diffusion kernels to solve P3
- 2 group (flux0 and flux2)
- Fixed source

diff-1g-crit.i
- Moltres diffusion kernels
- 1 group
- Criticality source
- xmax = 200
- keff = 1.0527815106033

diff-3g-fixed.i:
- Moltres diffusion kernels
- 3 group
- Fixed source
- xmax = 50

diff-3g-crit.i:
- Moltres diffusion kernels
- 3 group
- Criticality source
- xmax = 300, nx = 500
- keff = 1.02877615e+00

diff-3g-crit1.i:
- Moltres diffusion kernels
- 3 group
- Criticality source
- xmax = 793, nx = 500
- keff = 1.06527761e+00

diff-3g-crit2.i:
- Moltres diffusion kernels
- 3 group
- Criticality source
- adds bottom and top reflectors
- keff = 1.07344588e+00
