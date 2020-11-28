
[GlobalParams]
  num_groups = 1
  num_precursor_groups = 8
  use_exp_form = false
  group_fluxes = 'flux'
  sss2_input = true
  account_delayed = false
  temperature = 300
[]

[Mesh]
  type = GeneratedMesh
  dim = 1
  # xmax = 5.
  xmax = 200.
  nx = 400
  elem_type = EDGE2
[]

[Variables]
  [./flux]
    order = FIRST
    family = LAGRANGE
    initial_condition = 1
  [../]
[]

[Kernels]
  [./diff_flux]
    type = GroupDiffusion
    variable = flux
    group_number = 1
  [../]
  [./sigma_r_flux]
    type = SigmaR
    variable = flux
    group_number = 1
  [../]
  [./fission_source_group1]
    type = CoupledFissionEigenKernel
    variable = flux
    group_number = 1
  [../]
[]

[BCs]
  [./vacuum_group1]
    type = VacuumConcBC
    boundary = 'left right'
    variable = flux
  [../]
[]

[Materials]
  [./cross_sections]
    type = GenericMoltresMaterial
    property_tables_root = 'xs/'
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
  type = InversePowerMethod
  max_power_iterations = 150
  xdiff = 'group1diff'

  bx_norm = 'bnorm'
  k0 = 1.4
  pfactor = 1e-4
  l_max_its = 300

  # eig_check_tol = 1e-09
  # sol_check_tol = 1e-08

  # solve_type = 'NEWTON'
  solve_type = 'JFNK'
  petsc_options = '-snes_converged_reason -ksp_converged_reason -snes_linesearch_monitor'
  petsc_options_iname = '-pc_type -sub_pc_type'
  petsc_options_value = 'asm lu'
[]

[Postprocessors]
  [./bnorm]
    type = ElmIntegTotFissNtsPostprocessor
    execute_on = linear
  [../]
  [./group1diff]
    type = ElementL2Diff
    variable = flux
    execute_on = 'linear timestep_end'
    use_displaced_mesh = false
  [../]
[]

[Outputs]
  perf_graph = true
  print_linear_residuals = true
  file_base = 'input-1g-crit'
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
    variable = flux
    start_point = '0 0 0'
    end_point = '200 0 0'
    sort_by = x
    num_points = 300
    execute_on = timestep_end
  [../]
[]