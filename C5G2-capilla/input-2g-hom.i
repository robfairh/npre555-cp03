[GlobalParams]
  num_groups = 2
  num_precursor_groups = 8
  flux0_groups = 'flux0_1 flux0_2'
  flux2_groups = 'flux2_1 flux2_2'
  temperature = 300
[]

[Mesh]
  file = 2D.msh
[]

[Variables]
  [./flux0_1]
    order = FIRST
    family = LAGRANGE
    initial_condition = 1
  [../]
  [./flux0_2]
    order = FIRST
    family = LAGRANGE
    initial_condition = 1
  [../]

  [./flux2_1]
    order = FIRST
    family = LAGRANGE
    initial_condition = 1
  [../]
  [./flux2_2]
    order = FIRST
    family = LAGRANGE
    initial_condition = 1
  [../]
[]

[Kernels]
  # Eq A group 1
  [./diff_flux0_1]
    type = P3Diffusion
    variable = flux0_1
    group_number = 1
    equation_number = 0
  [../]
  [./sigma_r0_flux0_1]
    type = P3SigmaR
    variable = flux0_1
    group_number = 1
    equation_number = 0
  [../]
  [./sigma_r0_flux2_1]
    type = P3SigmaCoupled
    variable = flux0_1
    group_number = 1
    equation_number = 0
  [../]
  [./inscatter_flux1]
    type = P3InScatter
    variable = flux0_1
    group_number = 1
    equation_number = 0
  [../]
  [./fission_sourceA1]
    type = P3FissionEigenKernel
    variable = flux0_1
    group_number = 1
    equation_number = 0
  [../]

  # Eq A group 2
  [./diff_flux0_2]
    type = P3Diffusion
    variable = flux0_2
    group_number = 2
    equation_number = 0
  [../]
  [./sigma_r0_flux0_2]
    type = P3SigmaR
    variable = flux0_2
    group_number = 2
    equation_number = 0
  [../]
  [./sigma_r0_flux2_2]
    type = P3SigmaCoupled
    variable = flux0_2
    group_number = 2
    equation_number = 0
  [../]
  [./inscatter_flux2]
    type = P3InScatter
    variable = flux0_2
    group_number = 2
    equation_number = 0
  [../]
  [./fission_sourceA2]
    type = P3FissionEigenKernel
    variable = flux0_2
    group_number = 2
    equation_number = 0
  [../]

  # Eq B group 1
  [./diff_fluxB1]
    type = P3Diffusion
    variable = flux2_1
    group_number = 1
    equation_number = 1
  [../]
  [./sigma_r1_flux21]
    type = P3SigmaR
    variable = flux2_1
    group_number = 1
    equation_number = 1
  [../]
  [./sigma_r1_flux01]
    type = P3SigmaCoupled
    variable = flux2_1
    group_number = 1
    equation_number = 1
  [../]
  [./inscatter_fluxB1]
    type = P3InScatter
    variable = flux2_1
    group_number = 1
    equation_number = 1
  [../]
  [./fission_sourceB1]
    type = P3FissionEigenKernel
    variable = flux2_1
    group_number = 1
    equation_number = 1
  [../]

  # Eq B group 2
  [./diff_fluxB2]
    type = P3Diffusion
    variable = flux2_2
    group_number = 2
    equation_number = 1
  [../]
  [./sigma_r1_flux22]
    type = P3SigmaR
    variable = flux2_2
    group_number = 2
    equation_number = 1
  [../]
  [./sigma_r1_flux02]
    type = P3SigmaCoupled
    variable = flux2_2
    group_number = 2
    equation_number = 1
  [../]
  [./inscatter_fluxB2]
    type = P3InScatter
    variable = flux2_2
    group_number = 2
    equation_number = 1
  [../]
  [./fission_sourceB2]
    type = P3FissionEigenKernel
    variable = flux2_2
    group_number = 2
    equation_number = 1
  [../]
[]

[BCs]
  [./vacuum_fluxA_1]
    type = P3VacuumBC
    boundary = 'boundary'
    variable = flux0_1
    second_flux = flux2_1
    val1 = 0.5
    val2 = -0.75
  [../]
  [./vacuum_fluxA_2]
    type = P3VacuumBC
    boundary = 'boundary'
    variable = flux0_2
    second_flux = flux2_2
    val1 = 0.5
    val2 = -0.75
  [../]

  [./vacuum_fluxB_1]
    type = P3VacuumBC
    boundary = 'boundary'
    variable = flux2_1
    second_flux = flux0_1
    val1 = 0.525
    val2 = -0.075
  [../]
  [./vacuum_fluxB_2]
    type = P3VacuumBC
    boundary = 'boundary'
    variable = flux2_2
    second_flux = flux0_2
    val1 = 0.525
    val2 = -0.075
  [../]
[]

[Materials]
  [./cross_sections_mox]
    type = GenericMoltresMaterial
    property_tables_root = 'xs2g-homo/mox_'
    interp_type = 'none'
    block = 'mox1a mox2a mox3a mox1b mox2b mox3b gtubec gtubed fchamberc fchamberd'
  [../]
  [./cross_sections_uo2]
    type = GenericMoltresMaterial
    property_tables_root = 'xs2g-homo/uo2_'
    interp_type = 'none'
    block = 'uo2a uo2b gtubea gtubeb fchambera fchamberb'
  [../]
  [./cross_sections_reflec]
    type = GenericMoltresMaterial
    property_tables_root = 'xs2g-homo/reflec_'
    interp_type = 'none'
    block = 'reflec'
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

  # solve_type = 'NEWTON' # needs the Jacobians
  # solve_type = 'JFNK' # doesn't need the Jacobians
  solve_type = 'PJFNK' # doesn't need the Jacobians

  petsc_options = '-snes_converged_reason -ksp_converged_reason -snes_linesearch_monitor'
  petsc_options_iname = '-pc_type -sub_pc_type'
  petsc_options_value = 'asm lu'

  # petsc_options_iname = '-pc_type -sub_ksp_type -snes_linesearch_minlambda'
  # petsc_options_value = 'lu       preonly       1e-3'
[]

[Postprocessors]
  [./bnorm]
    type = ElmIntegTotFissNtsPostprocessor
    execute_on = linear
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
  file_base = 'input-2g-hom'
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
    variable = 'flux0_1 flux0_2 flux2_1 flux2_2'
    start_point = '0 10.71 0'
    end_point = '64.26 10.71 0'
    sort_by = x
    num_points = 400
    execute_on = timestep_end
  [../]
[]
