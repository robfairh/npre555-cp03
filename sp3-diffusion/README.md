This study compares Cerberus outputs with Moltres outputs.

# Files

* 1D-fuel-reflec.geo: Comprises an active core region with top and bottom reflectors
* sp3-1g-fixed.i: P3moltres kernels, 1G, Fixed source, xmax = 50
* sp3-1g-crit.i: P3moltres kernels, 1G, Criticality source, xmax = 200
* sp3-3g-fixed.i: P3moltres kernels, 3G, Fixed source, xmax = 50
* sp3-3g-crit.i: P3moltres kernels, 3G, Criticality source, xmax = 300, nx = 500
* sp3-3g-crit1.i: P3moltres kernels, 3G, Criticality source, xmax = 793, nx = 500
* sp3-3g-crit2.i: P3moltres kernels, 3G, Criticality source, 1D-fuel-reflec.msh
* diff-1g-fixed.i: Moltres diffusion kernels, 1G, Fixed source, xmax = 50
* diff-1g-crit.i: Moltres diffusion kernels, 1G, Criticality source, xmax = 200
* diff-3g-fixed.i: Moltres diffusion kernels, 3G, Fixed source, xmax = 50
* diff-3g-crit.i: Moltres diffusion kernels, 3G, Criticality source, xmax = 300, nx = 500
* diff-3g-crit1.i: Moltres diffusion kernels, 3G, Criticality source, xmax = 793, nx = 500
* diff-3g-crit2.i: Moltres diffusion kernels, 3G, Criticality source, 1D-fuel-reflec.msh


# Results:

* sp3-1g-crit.i: keff = 1.0601080741
* sp3-3g-crit.i: keff = 1.03004681e+00
* sp3-3g-crit1.i: keff = 1.06551447e+00
* sp3-3g-crit2.i: keff = 1.07342236e+00
* diff-1g-crit.i: keff = 1.0528531829
* diff-3g-crit.i: keff = 1.02877615e+00
* diff-3g-crit1.i: keff = 1.06527761e+00
* diff-3g-crit2.i: keff = 1.07344588e+00
