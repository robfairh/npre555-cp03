# creates .msh
gmsh -2 -o 3D.msh 3D.geo

# creates cross-section files
python constants.py

# runs Cerberus
conda activate moose
../P3Moltres/p3moltres-opt -i input.i
