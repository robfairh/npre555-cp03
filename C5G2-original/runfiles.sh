# creates .msh
gmsh -2 -o 2D-power.msh 2D-power.geo

# creates cross-section files
python constants.py

# runs Cerberus
conda activate moose
../P3Moltres/p3moltres-opt -i input-power.i
../P3Moltres/p3moltres-opt -i input-power-correct.i

$MOLTRES/moltres-opt -i input-moltres.i

# creates images
python postprocessing.py
