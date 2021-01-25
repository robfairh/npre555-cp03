#include "P3SigmaR.h"

registerMooseObject("ExampleApp", P3SigmaR);

template <>
InputParameters
validParams<P3SigmaR>()
{
  InputParameters params = validParams<Kernel>();
  params.addRequiredParam<unsigned int>("group_number", "The current energy group");
  params.addRequiredParam<unsigned int>("equation_number",
                                        "0 for equation A and 1 for equation B ");
  return params;
}

P3SigmaR::P3SigmaR(const InputParameters & parameters)
  : Kernel(parameters),
    _equation(getParam<unsigned int>("equation_number")),
    _group(getParam<unsigned int>("group_number") - 1),
    _remxsA(getMaterialProperty<std::vector<Real>>("remxsA")),
    _remxsB(getMaterialProperty<std::vector<Real>>("remxsB"))
{
}

Real
P3SigmaR::computeQpResidual()
{
  Real res = 0;

  if (_equation == 0)
      res = _remxsA[_qp][_group];
  else
      res = _remxsB[_qp][_group];

  res *= _u[_qp] * _test[_i][_qp];

  return res;
}

Real
P3SigmaR::computeQpJacobian()
{
  Real jac = 0;

  if (_equation == 0)
      jac = _remxsA[_qp][_group];
  else
      jac = _remxsB[_qp][_group];
  
  jac *= _phi[_j][_qp] * _test[_i][_qp];

  return jac;
}

Real
P3SigmaR::computeQpOffDiagJacobian()
{
  return 0;
}