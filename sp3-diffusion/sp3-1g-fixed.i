
[GlobalParams]
  num_groups = 1
  num_precursor_groups = 8
  flux0_groups = 'flux0_1'
  flux2_groups = 'flux2_1'
  temperature = 300
[]

[Mesh]
  type = GeneratedMesh
  dim = 1
  xmax = 50.
  nx = 100
  elem_type = EDGE2
[]

[Variables]
  [./flux0_1]
    order = FIRST
    family = LAGRANGE
    initial_condition = 1
  [../]
  [./flux2_1]
    order = FIRST
    family = LAGRANGE
    initial_condition = 1
  [../]
[]

[Kernels]
  # Eq A
  [./diff_flux0]
    type = P3Diffusion
    variable = flux0_1
    group_number = 1
    equation_number = 0
  [../]
  [./sigma_r0_flux0]
    type = P3SigmaR
    variable = flux0_1
    group_number = 1
    equation_number = 0
  [../]
  [./sigma_r0_flux2]
    type = P3SigmaCoupled
    variable = flux0_1
    group_number = 1
    equation_number = 0
  [../]
  [./source0]
    type = BodyForce
    variable = flux0_1
    value = 1
  [../]

  # Eq B
  [./diff_flux1]
    type = P3Diffusion
    variable = flux2_1
    group_number = 1
    equation_number = 1
  [../]
  [./sigma_r1_flux2]
    type = P3SigmaR
    variable = flux2_1
    group_number = 1
    equation_number = 1
  [../]
  [./sigma_r1_flux0]
    type = P3SigmaCoupled
    variable = flux2_1
    group_number = 1
    equation_number = 1
  [../]
  [./source1]
    type = BodyForce
    variable = flux2_1
    value = -0.4
  [../]
[]

[BCs]
  [./vacuum_flux0]
    type = P3VacuumBC
    boundary = 'left right'
    variable = flux0_1
    second_flux = flux2_1
    val1 = 0.5
    val2 = -0.75
  [../]

  [./vacuum_flux2]
    type = P3VacuumBC
    boundary = 'left right'
    variable = flux2_1
    second_flux = flux0_1
    val1 = 0.525
    val2 = -0.075
  [../]
[]

[Materials]
  [./cross_sections]
    type = GenericMoltresMaterial
    property_tables_root = 'xs1g-sp3/mhtgr_fuel_'
    interp_type = 'none'
  [../]
[]

# [Preconditioning]
#   [./SMP]
#     type = SMP
#     full = true
#   [../]
# []

[Executioner]
  type = Steady
  l_max_its = 100
  nl_abs_tol = 1e-5
  nl_max_its = 20

  # solve_type = 'NEWTON'
  # petsc_options = '-snes_converged_reason -ksp_converged_reason -snes_linesearch_monitor'
  # petsc_options_iname = '-pc_type -sub_ksp_type -snes_linesearch_minlambda'
  # petsc_options_value = 'lu       preonly       1e-3'

  solve_type = 'JFNK'
[]

[Outputs]
  perf_graph = true
  print_linear_residuals = true
  file_base = 'sp3-1g-fixed'
  execute_on = timestep_end
  exodus = true
  csv = true
[]

[Debug]
  show_var_residual_norms = true
[]

[VectorPostprocessors]
  [./line]
    type = LineValueSampler
    variable = 'flux0_1 flux2_1'
    start_point = '0 0 0'
    end_point = '50 0 0'
    sort_by = x
    num_points = 100
    execute_on = timestep_end
  [../]
[]
