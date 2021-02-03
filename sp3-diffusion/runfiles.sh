gmsh -1 -o 1D-fuel-reflec.msh 1D-fuel-reflec.geo
python constants.py

$MOLTRES/moltres-opt -i diff-1g-fixed.i
$MOLTRES/moltres-opt -i diff-1g-crit.i

$MOLTRES/moltres-opt -i diff-3g-fixed.i
$MOLTRES/moltres-opt -i diff-3g-crit.i
$MOLTRES/moltres-opt -i diff-3g-crit1.i
$MOLTRES/moltres-opt -i diff-3g-crit2.i

conda activate moose
../P3Moltres/p3moltres-opt -i sp3-1g-fixed.i
../P3Moltres/p3moltres-opt -i sp3-1g-crit.i

../P3Moltres/p3moltres-opt -i sp3-3g-fixed.i
../P3Moltres/p3moltres-opt -i sp3-3g-crit.i
../P3Moltres/p3moltres-opt -i sp3-3g-crit1.i
../P3Moltres/p3moltres-opt -i sp3-3g-crit2.i

python postprocessing.py
