# creates .msh
gmsh -2 -o 2D.msh 2D.geo
gmsh -2 -o 2D.msh 2D.geo

# creates cross-section files
python constants.py

# runs Cerberus
conda activate moose
../P3Moltres/p3moltres-opt -i input.i

# creates images
python postprocessing.py
