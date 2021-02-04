# creates .msh
gmsh -2 -o bl-2d-simple.msh bl-2d-simple.geo

# creates cross-section files
python constants.py

# runs Cerberus
conda activate moose
../P3Moltres/p3moltres-opt -i input.i

# creates images
python postprocessing.py
