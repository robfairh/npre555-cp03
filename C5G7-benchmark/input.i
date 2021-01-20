[GlobalParams]
  num_groups = 7
  num_precursor_groups = 8
  flux0_groups = 'flux0_1 flux0_2 flux0_3 flux0_4 flux0_5 flux0_6 flux0_7'
  flux2_groups = 'flux2_1 flux2_2 flux2_3 flux2_4 flux2_5 flux2_6 flux2_7'
  temperature = 300
[]

[Mesh]
  file = 3D.msh
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
  [./flux0_3]
    order = FIRST
    family = LAGRANGE
    initial_condition = 1
  [../]
  [./flux0_4]
    order = FIRST
    family = LAGRANGE
    initial_condition = 1
  [../]
  [./flux0_5]
    order = FIRST
    family = LAGRANGE
    initial_condition = 1
  [../]
  [./flux0_6]
    order = FIRST
    family = LAGRANGE
    initial_condition = 1
  [../]
  [./flux0_7]
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
  [./flux2_3]
    order = FIRST
    family = LAGRANGE
    initial_condition = 1
  [../]
  [./flux2_4]
    order = FIRST
    family = LAGRANGE
    initial_condition = 1
  [../]
  [./flux2_5]
    order = FIRST
    family = LAGRANGE
    initial_condition = 1
  [../]
  [./flux2_6]
    order = FIRST
    family = LAGRANGE
    initial_condition = 1
  [../]
  [./flux2_7]
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

  # Eq A group 3
  [./diff_flux0_3]
    type = P3Diffusion
    variable = flux0_3
    group_number = 3
    equation_number = 0
  [../]
  [./sigma_r0_flux0_3]
    type = P3SigmaR
    variable = flux0_3
    group_number = 3
    equation_number = 0
  [../]
  [./sigma_r0_flux2_3]
    type = P3SigmaCoupled
    variable = flux0_3
    group_number = 3
    equation_number = 0
  [../]
  [./inscatter_flux3]
    type = P3InScatter
    variable = flux0_3
    group_number = 3
    equation_number = 0
  [../]
  [./fission_sourceA3]
    type = P3FissionEigenKernel
    variable = flux0_3
    group_number = 3
    equation_number = 0
  [../]

  # Eq A group 4
  [./diff_flux0_4]
    type = P3Diffusion
    variable = flux0_4
    group_number = 4
    equation_number = 0
  [../]
  [./sigma_r0_flux0_4]
    type = P3SigmaR
    variable = flux0_4
    group_number = 4
    equation_number = 0
  [../]
  [./sigma_r0_flux2_4]
    type = P3SigmaCoupled
    variable = flux0_4
    group_number = 4
    equation_number = 0
  [../]
  [./inscatter_flux4]
    type = P3InScatter
    variable = flux0_4
    group_number = 4
    equation_number = 0
  [../]
  [./fission_sourceA4]
    type = P3FissionEigenKernel
    variable = flux0_4
    group_number = 4
    equation_number = 0
  [../]

  # Eq A group 5
  [./diff_flux0_5]
    type = P3Diffusion
    variable = flux0_5
    group_number = 5
    equation_number = 0
  [../]
  [./sigma_r0_flux0_5]
    type = P3SigmaR
    variable = flux0_5
    group_number = 5
    equation_number = 0
  [../]
  [./sigma_r0_flux2_5]
    type = P3SigmaCoupled
    variable = flux0_5
    group_number = 5
    equation_number = 0
  [../]
  [./inscatter_flux5]
    type = P3InScatter
    variable = flux0_5
    group_number = 5
    equation_number = 0
  [../]
  [./fission_sourceA5]
    type = P3FissionEigenKernel
    variable = flux0_5
    group_number = 5
    equation_number = 0
  [../]

  # Eq A group 6
  [./diff_flux0_6]
    type = P3Diffusion
    variable = flux0_6
    group_number = 6
    equation_number = 0
  [../]
  [./sigma_r0_flux0_6]
    type = P3SigmaR
    variable = flux0_6
    group_number = 6
    equation_number = 0
  [../]
  [./sigma_r0_flux2_6]
    type = P3SigmaCoupled
    variable = flux0_6
    group_number = 6
    equation_number = 0
  [../]
  [./inscatter_flux6]
    type = P3InScatter
    variable = flux0_6
    group_number = 6
    equation_number = 0
  [../]
  [./fission_sourceA6]
    type = P3FissionEigenKernel
    variable = flux0_6
    group_number = 6
    equation_number = 0
  [../]

  # Eq A group 7
  [./diff_flux0_7]
    type = P3Diffusion
    variable = flux0_7
    group_number = 7
    equation_number = 0
  [../]
  [./sigma_r0_flux0_7]
    type = P3SigmaR
    variable = flux0_7
    group_number = 7
    equation_number = 0
  [../]
  [./sigma_r0_flux2_7]
    type = P3SigmaCoupled
    variable = flux0_7
    group_number = 7
    equation_number = 0
  [../]
  [./inscatter_flux7]
    type = P3InScatter
    variable = flux0_7
    group_number = 7
    equation_number = 0
  [../]
  [./fission_sourceA7]
    type = P3FissionEigenKernel
    variable = flux0_7
    group_number = 7
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

  # Eq B group 3
  [./diff_fluxB3]
    type = P3Diffusion
    variable = flux2_3
    group_number = 3
    equation_number = 1
  [../]
  [./sigma_r1_flux23]
    type = P3SigmaR
    variable = flux2_3
    group_number = 3
    equation_number = 1
  [../]
  [./sigma_r1_flux03]
    type = P3SigmaCoupled
    variable = flux2_3
    group_number = 3
    equation_number = 1
  [../]
  [./inscatter_fluxB3]
    type = P3InScatter
    variable = flux2_3
    group_number = 3
    equation_number = 1
  [../]
  [./fission_sourceB3]
    type = P3FissionEigenKernel
    variable = flux2_3
    group_number = 3
    equation_number = 1
  [../]

  # Eq B group 4
  [./diff_fluxB4]
    type = P3Diffusion
    variable = flux2_4
    group_number = 4
    equation_number = 1
  [../]
  [./sigma_r1_flux24]
    type = P3SigmaR
    variable = flux2_4
    group_number = 4
    equation_number = 1
  [../]
  [./sigma_r1_flux04]
    type = P3SigmaCoupled
    variable = flux2_4
    group_number = 4
    equation_number = 1
  [../]
  [./inscatter_fluxB4]
    type = P3InScatter
    variable = flux2_4
    group_number = 4
    equation_number = 1
  [../]
  [./fission_sourceB4]
    type = P3FissionEigenKernel
    variable = flux2_4
    group_number = 4
    equation_number = 1
  [../]

  # Eq B group 5
  [./diff_fluxB5]
    type = P3Diffusion
    variable = flux2_5
    group_number = 5
    equation_number = 1
  [../]
  [./sigma_r1_flux25]
    type = P3SigmaR
    variable = flux2_5
    group_number = 5
    equation_number = 1
  [../]
  [./sigma_r1_flux05]
    type = P3SigmaCoupled
    variable = flux2_5
    group_number = 5
    equation_number = 1
  [../]
  [./inscatter_fluxB5]
    type = P3InScatter
    variable = flux2_5
    group_number = 5
    equation_number = 1
  [../]
  [./fission_sourceB5]
    type = P3FissionEigenKernel
    variable = flux2_5
    group_number = 5
    equation_number = 1
  [../]

  # Eq B group 6
  [./diff_fluxB6]
    type = P3Diffusion
    variable = flux2_6
    group_number = 6
    equation_number = 1
  [../]
  [./sigma_r1_flux26]
    type = P3SigmaR
    variable = flux2_6
    group_number = 6
    equation_number = 1
  [../]
  [./sigma_r1_flux06]
    type = P3SigmaCoupled
    variable = flux2_6
    group_number = 6
    equation_number = 1
  [../]
  [./inscatter_fluxB6]
    type = P3InScatter
    variable = flux2_6
    group_number = 6
    equation_number = 1
  [../]
  [./fission_sourceB6]
    type = P3FissionEigenKernel
    variable = flux2_6
    group_number = 6
    equation_number = 1
  [../]

  # Eq B group 7
  [./diff_fluxB7]
    type = P3Diffusion
    variable = flux2_7
    group_number = 7
    equation_number = 1
  [../]
  [./sigma_r1_flux27]
    type = P3SigmaR
    variable = flux2_7
    group_number = 7
    equation_number = 1
  [../]
  [./sigma_r1_flux07]
    type = P3SigmaCoupled
    variable = flux2_7
    group_number = 7
    equation_number = 1
  [../]
  [./inscatter_fluxB7]
    type = P3InScatter
    variable = flux2_7
    group_number = 7
    equation_number = 1
  [../]
  [./fission_sourceB7]
    type = P3FissionEigenKernel
    variable = flux2_7
    group_number = 7
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
  [./vacuum_fluxA_3]
    type = P3VacuumBC
    boundary = 'boundary'
    variable = flux0_3
    second_flux = flux2_3
    val1 = 0.5
    val2 = -0.75
  [../]
  [./vacuum_fluxA_4]
    type = P3VacuumBC
    boundary = 'boundary'
    variable = flux0_4
    second_flux = flux2_4
    val1 = 0.5
    val2 = -0.75
  [../]
  [./vacuum_fluxA_5]
    type = P3VacuumBC
    boundary = 'boundary'
    variable = flux0_5
    second_flux = flux2_5
    val1 = 0.5
    val2 = -0.75
  [../]
  [./vacuum_fluxA_6]
    type = P3VacuumBC
    boundary = 'boundary'
    variable = flux0_6
    second_flux = flux2_6
    val1 = 0.5
    val2 = -0.75
  [../]
  [./vacuum_fluxA_7]
    type = P3VacuumBC
    boundary = 'boundary'
    variable = flux0_7
    second_flux = flux2_7
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
  [./vacuum_fluxB_3]
    type = P3VacuumBC
    boundary = 'boundary'
    variable = flux2_3
    second_flux = flux0_3
    val1 = 0.525
    val2 = -0.075
  [../]
  [./vacuum_fluxB_4]
    type = P3VacuumBC
    boundary = 'boundary'
    variable = flux2_4
    second_flux = flux0_4
    val1 = 0.525
    val2 = -0.075
  [../]
  [./vacuum_fluxB_5]
    type = P3VacuumBC
    boundary = 'boundary'
    variable = flux2_5
    second_flux = flux0_5
    val1 = 0.525
    val2 = -0.075
  [../]
  [./vacuum_fluxB_6]
    type = P3VacuumBC
    boundary = 'boundary'
    variable = flux2_6
    second_flux = flux0_6
    val1 = 0.525
    val2 = -0.075
  [../]
    [./vacuum_fluxB_7]
    type = P3VacuumBC
    boundary = 'boundary'
    variable = flux2_7
    second_flux = flux0_7
    val1 = 0.525
    val2 = -0.075
  [../]
[]

# Mesh: MOX1 = MOX 8.7
# XS: MOX1 = MOX 8.7

[Materials]
  [./cross_sections_mox1]
    type = GenericMoltresMaterial
    property_tables_root = 'xs7g/mox1_'
    interp_type = 'none'
    block = 'MOXAfuel1 MOXBfuel1'
  [../]
  [./cross_sections_mox2]
    type = GenericMoltresMaterial
    property_tables_root = 'xs7g/mox2_'
    interp_type = 'none'
    block = 'MOXAfuel2 MOXBfuel2'
  [../]
  [./cross_sections_mox3]
    type = GenericMoltresMaterial
    property_tables_root = 'xs7g/mox3_'
    interp_type = 'none'
    block = 'MOXAfuel3 MOXBfuel3'
  [../]
  [./cross_sections_uo2]
    type = GenericMoltresMaterial
    property_tables_root = 'xs7g/uo2_'
    interp_type = 'none'
    block = 'UO2Afuel UO2Bfuel'
  [../]
  [./cross_sections_gtube]
    type = GenericMoltresMaterial
    property_tables_root = 'xs7g/gtube_'
    interp_type = 'none'
    block = 'UO2Aguide UO2Bguide MOXAguide MOXBguide'
  [../]
  [./cross_sections_fchamber]
    type = GenericMoltresMaterial
    property_tables_root = 'xs7g/fisc_'
    interp_type = 'none'
    block = 'UO2Afission UO2Bfission MOXAfission MOXBfission'
  [../]
  [./cross_sections_moder]
    type = GenericMoltresMaterial
    property_tables_root = 'xs7g/moder_'
    interp_type = 'none'
    block = 'UO2Amod UO2Bmod MOXAmod MOXBmod'
  [../]
  [./cross_sections_reflec]
    type = GenericMoltresMaterial
    property_tables_root = 'xs7g/reflec_'
    interp_type = 'none'
    block = 'Reflec'
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

  [./total_fission_heat]
    type = ElmIntegTotFissHeatPostprocessor
    execute_on = timestep_end
    outputs = 'csv console'
  [../]

  [./uo2a_fission_heat]
    type = ElmIntegTotFissHeatPostprocessor
    execute_on = timestep_end
    outputs = 'csv console'
    block = 'UO2Afuel UO2Amod UO2Aguide UO2Afission'
  [../]
  [./uo2b_fission_heat]
    type = ElmIntegTotFissHeatPostprocessor
    execute_on = timestep_end
    outputs = 'csv console'
    block = 'UO2Bfuel UO2Bmod UO2Bguide UO2Bfission'
  [../]
  [./moxa_fission_heat]
    type = ElmIntegTotFissHeatPostprocessor
    execute_on = timestep_end
    outputs = 'csv console'
    block = 'MOXAfuel1 MOXAfuel2 MOXAfuel3 MOXAmod MOXAguide MOXAfission'
  [../]
  [./moxb_fission_heat]
    type = ElmIntegTotFissHeatPostprocessor
    execute_on = timestep_end
    outputs = 'csv console'
    block = 'MOXBfuel1 MOXBfuel2 MOXBfuel3 MOXBmod MOXBguide MOXBfission'
  [../]
[]

[Outputs]
  perf_graph = true
  print_linear_residuals = true
  file_base = 'output'
  execute_on = timestep_end
  exodus = true
  csv = true
[]

[Debug]
  show_var_residual_norms = true
[]

# [VectorPostprocessors]
#   [./line]
#     type = LineValueSampler
#     variable = 'flux0_1 flux0_2 flux2_1 flux2_2'
#     start_point = '0 10.71 0'
#     end_point = '64.26 10.71 0'
#     sort_by = x
#     num_points = 400
#     execute_on = timestep_end
#   [../]
# []
