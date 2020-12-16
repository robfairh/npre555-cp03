
[GlobalParams]
  num_groups = 3
  num_precursor_groups = 8
  use_exp_form = false
  group_fluxes = 'flux1 flux2 flux3'
  sss2_input = true
  account_delayed = false
  temperature = 300
[]

[Mesh]
  [mymesh]
    type = FileMeshGenerator
    file = '1D-fuel-reflec.msh'
  [../]
  [./add_side_sets]
    type = SideSetsFromPointsGenerator
    input = mymesh
    points = '0    0  0
              0  1073  0'
    new_boundary = 'ref_bot ref_top'
  [../]
[../]

[Variables]
  [./flux1]
    order = FIRST
    family = LAGRANGE
    initial_condition = 1
  [../]
  [./flux2]
    order = FIRST
    family = LAGRANGE
    initial_condition = 1
  [../]
  [./flux3]
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
  [./inscatter_flux1]
    type = InScatter
    variable = flux1
    group_number = 1
  [../]
  [./fission_source_flux1]
    type = CoupledFissionEigenKernel
    variable = flux1
    group_number = 1
  [../]

  [./diff_flux2]
    type = GroupDiffusion
    variable = flux2
    group_number = 2
  [../]
  [./sigma_r_flux2]
    type = SigmaR
    variable = flux2
    group_number = 2
  [../]
  [./inscatter_flux2]
    type = InScatter
    variable = flux2
    group_number = 2
  [../]
  [./fission_source_flux2]
    type = CoupledFissionEigenKernel
    variable = flux2
    group_number = 2
  [../]

  [./diff_flux3]
    type = GroupDiffusion
    variable = flux3
    group_number = 3
  [../]
  [./sigma_r_flux3]
    type = SigmaR
    variable = flux3
    group_number = 3
  [../]
  [./inscatter_flux3]
    type = InScatter
    variable = flux3
    group_number = 3
  [../]
  [./fission_source_flux3]
    type = CoupledFissionEigenKernel
    variable = flux3
    group_number = 3
  [../]
[]

[BCs]
  [./vacuum1]
    type = VacuumConcBC
    boundary = 'ref_bot ref_top'
    variable = flux1
  [../]
  [./vacuum2]
    type = VacuumConcBC
    boundary = 'ref_bot ref_top'
    variable = flux2
  [../]
  [./vacuum3]
    type = VacuumConcBC
    boundary = 'ref_bot ref_top'
    variable = flux3
  [../]  
[]

[Materials]
  [./fuel_constants]
    type = GenericMoltresMaterial
    property_tables_root = 'xs3g-diff/mhtgr_fuel_'
    interp_type = 'none'
    block = 'fuel'
  [../]
  [./brefl_constants]
    type = GenericMoltresMaterial
    property_tables_root = 'xs3g-diff/mhtgr_brefl_'
    interp_type = 'none'
    block = 'breflector'
  [../]
  [./trefl_constants]
    type = GenericMoltresMaterial
    property_tables_root = 'xs3g-diff/mhtgr_trefl_'
    interp_type = 'none'
    block = 'treflector'
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
  max_power_iterations = 200
  xdiff = 'group1diff'

  bx_norm = 'bnorm'
  k0 = 1.4
  pfactor = 1e-4
  l_max_its = 300

  eig_check_tol = 1e-08
  sol_check_tol = 1e-08

  solve_type = 'NEWTON'

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
    variable = flux1
    execute_on = 'linear timestep_end'
    use_displaced_mesh = false
  [../]
[]

[Outputs]
  perf_graph = true
  print_linear_residuals = true
  file_base = 'diff-3g-crit2'
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
    variable = 'flux1 flux2 flux3'
    start_point = '0 0 0'
    end_point = '0 1073 0'
    sort_by = y
    num_points = 500
    execute_on = timestep_end
  [../]
[]
