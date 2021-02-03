
[GlobalParams]
  num_groups = 1
  num_precursor_groups = 8
  use_exp_form = false
  group_fluxes = 'flux1'
  sss2_input = true
  account_delayed = false
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
  [./flux1]
    order = FIRST
    family = LAGRANGE
    initial_condition = 1
  [../]
[]

[Kernels]
  [./diff_flux1]
    type = GroupDiffusion
    variable = flux1
    group_number = 1
  [../]
  [./sigma_r_flux1]
    type = SigmaR
    variable = flux1
    group_number = 1
  [../]
  [./source]
    type = BodyForce
    variable = flux1
    value = 1
  [../]
[]

[BCs]
  [./vacuum_group1]
    type = VacuumConcBC
    # type = DirichletBC
    # value = 0
    boundary = 'left right'
    variable = flux1
  [../]
[]

[Materials]
  [./cross_sections]
    type = GenericMoltresMaterial
    property_tables_root = 'xs1g-diff/fuel_'
    interp_type = 'linear'
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
  file_base = 'diff-1g-fixed'
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
    variable = flux1
    start_point = '0 0 0'
    end_point = '50 0 0'
    sort_by = x
    num_points = 100
    execute_on = timestep_end
  [../]
[]