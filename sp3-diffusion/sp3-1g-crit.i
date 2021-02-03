
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
  xmax = 200.
  nx = 400
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
  # Eq A group 1
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
  [./fission_source0]
    type = P3FissionEigenKernel
    variable = flux0_1
    group_number = 1
    equation_number = 0
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
  [./fission_source1]
    type = P3FissionEigenKernel
    variable = flux2_1
    group_number = 1
    equation_number = 1
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
    property_tables_root = 'xs1g-sp3/fuel_'
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
  type = InversePowerMethod
  max_power_iterations = 150
  xdiff = 'group1diff'

  bx_norm = 'bnorm'
  k0 = 1.4
  pfactor = 1e-4
  l_max_its = 300

  # eig_check_tol = 1e-09
  sol_check_tol = 1e-08

  # solve_type = 'NEWTON'
  solve_type = 'PJFNK'
  petsc_options = '-snes_converged_reason -ksp_converged_reason -snes_linesearch_monitor'
  petsc_options_iname = '-pc_type -sub_pc_type'
  petsc_options_value = 'asm lu'
[]

[Postprocessors]
  [./bnorm]
    type = ElmIntegTotFissNtsPostprocessor
    execute_on = linear
    first_flux = flux0_1
    second_flux = flux2_1
  [../]
  [./group1diff]
    type = ElementL2Diff
    variable = flux0_1
    execute_on = 'linear timestep_end'
    use_displaced_mesh = false
  [../]
[]

[Outputs]
  perf_graph = true
  print_linear_residuals = true
  file_base = 'sp3-1g-crit'
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
    end_point = '200 0 0'
    sort_by = x
    num_points = 300
    execute_on = timestep_end
  [../]
[]
