
[GlobalParams]
  num_groups = 1
  num_precursor_groups = 8
  flux0_groups = 'flux0'
  flux2_groups = 'flux2'
  temperature = 300
[]

[Mesh]
  file = bl-2d-simple.msh
[]

[Variables]
  [./flux0]
    order = FIRST
    family = LAGRANGE
    initial_condition = 1
  [../]
  [./flux2]
    order = FIRST
    family = LAGRANGE
    initial_condition = 1
  [../]
[]

[Kernels]
  # Eq A group 1
  [./diff_flux0]
    type = P3Diffusion
    variable = flux0
    group_number = 1
    equation_number = 0
  [../]
  [./sigma_r0_flux0]
    type = P3SigmaR
    variable = flux0
    group_number = 1
    equation_number = 0
  [../]
  [./sigma_r0_flux2]
    type = P3SigmaCoupled
    variable = flux0
    group_number = 1
    equation_number = 0
  [../]
  [./fission_source0]
    type = P3FissionEigenKernel
    variable = flux0
    group_number = 1
    equation_number = 0
  [../]

  # Eq B
  [./diff_flux1]
    type = P3Diffusion
    variable = flux2
    group_number = 1
    equation_number = 1
  [../]
  [./sigma_r1_flux2]
    type = P3SigmaR
    variable = flux2
    group_number = 1
    equation_number = 1
  [../]
  [./sigma_r1_flux0]
    type = P3SigmaCoupled
    variable = flux2
    group_number = 1
    equation_number = 1
  [../]
  [./fission_source1]
    type = P3FissionEigenKernel
    variable = flux2
    group_number = 1
    equation_number = 1
  [../]
[]

[BCs]
  [./vacuum_flux0]
    type = P3VacuumBC
    boundary = 'outer'
    variable = flux0
    second_flux = flux2
    val1 = 0.5
    val2 = -0.75
  [../]

  [./vacuum_flux2]
    type = P3VacuumBC
    boundary = 'outer'
    variable = flux2
    second_flux = flux0
    val1 = 0.525
    val2 = -0.075
  [../]
[]

[Materials]
  [./cross_sections_fuel]
    type = GenericMoltresMaterial
    property_tables_root = 'xs/fuel_'
    interp_type = 'none'
    block = 'fuel'
  [../]
  [./cross_sections_mod]
    type = GenericMoltresMaterial
    property_tables_root = 'xs/moderator_'
    interp_type = 'none'
    block = 'moderator'
  [../]
[]

[Preconditioning]
  [./SMP]
    type = SMP
    full = true
  [../]
[]

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
  [../]
  [./group1diff]
    type = ElementL2Diff
    variable = flux0
    execute_on = 'linear timestep_end'
    use_displaced_mesh = false
  [../]
[]

[Outputs]
  perf_graph = true
  print_linear_residuals = true
  file_base = 'input'
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
    variable = 'flux0 flux2'
    start_point = '0 4.5 0'
    end_point = '10 4.5 0'
    sort_by = x
    num_points = 150
    execute_on = timestep_end
  [../]
[]
