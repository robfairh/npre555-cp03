#include "ElmIntegTotFissPostprocessor.h"

registerMooseObject("ExampleApp", ElmIntegTotFissPostprocessor);

template <>
InputParameters
validParams<ElmIntegTotFissPostprocessor>()
{
  InputParameters params = validParams<ElementIntegralPostprocessor>();
  params.addRequiredCoupledVar("flux0_groups", "All the variables that hold the group fluxes 0. "
                                               "These MUST be listed by decreasing "
                                               "energy/increasing group number.");
  params.addRequiredCoupledVar("flux2_groups", "All the variables that hold the group fluxes 2. "
                                               "These MUST be listed by decreasing "
                                               "energy/increasing group number.");
  params.addRequiredParam<int>("num_groups", "The number of energy groups.");
  params.addParam<Real>("nt_scale", 1, "Scaling of the neutron fluxes to aid convergence.");
  return params;
}

ElmIntegTotFissPostprocessor::ElmIntegTotFissPostprocessor(const InputParameters & parameters)
  : ElementIntegralPostprocessor(parameters),
    _num_groups(getParam<int>("num_groups")),
    _fissxs(getMaterialProperty<std::vector<Real>>("fissxs")),
    // _vars(getCoupledMooseVars()),
    _nt_scale(getParam<Real>("nt_scale"))
{
  // addMooseVariableDependency(_vars);
  int n = coupledComponents("flux0_groups");
  // if (!(n == _num_groups))
  //   mooseError("The number of coupled variables doesn't match the number of groups.");

  _flux0_groups.resize(n);
  _flux2_groups.resize(n);

  for (unsigned int i = 0; i < _flux0_groups.size(); ++i)
  {
    _flux0_groups[i] = &coupledValue("flux0_groups", i);
    _flux2_groups[i] = &coupledValue("flux2_groups", i);
  }
}

Real
ElmIntegTotFissPostprocessor::computeQpIntegral()
{
  Real sum = 0;
  for (int i = 0; i < _num_groups; ++i)
    sum += computeFluxMultiplier(i) * ((*_flux0_groups[i])[_qp] - 2. * (*_flux2_groups[i])[_qp]) * _nt_scale;

  return sum;
}

Real
ElmIntegTotFissPostprocessor::computeFluxMultiplier(int index)
{
  return _fissxs[_qp][index];
}
