import numpy as np

sigt = 1
sigs0 = 0.4
sigs1 = 0.1
sigs2 = 0.1
sigs3 = 0.1

# source is isotropic
q0 = 1

sig0 = sigt-sigs0
sig1 = sigt-sigs1
sig2 = sigt-sigs2
sig3 = sigt-sigs3


def process_xs():
    # https://github.com/robfairh/mhtgr350-benchmark/blob/serpent-moltres/fullcore3G/fullcore3G-LBP.coe
    # 9 176 (fuel)

    fluxg = np.array([1.41871E+21, 3.82855E+21, 1.09417E+21])
    totxsg = np.array([2.07015E-01, 3.42755E-01, 3.63852E-01])
    absxsg = np.array([1.35139E-04, 2.50001E-03, 1.22535E-02])
    s0xsg = np.array([[1.93112E-01, 1.37674E-02, 0.00000E+00],
                    [0.00000E+00, 3.36889E-01, 3.36605E-03],
                    [0.00000E+00, 3.59504E-03, 3.48004E-01]])
    s1xsg = np.array([[2.53397E-02, -3.82909E-03, 0.00000E+00],
                    [0.00000E+00, 2.03290E-02, -7.86728E-04],
                    [0.00000E+00, -3.66985E-04, 1.15004E-02]])
    dxsg = np.array([1.99474E+00, 1.03279E+00, 9.49027E-01])

    flux = sum(fluxg)
    totxs = sum(totxsg * fluxg)/flux
    absxs = sum(absxsg * fluxg)/flux
    s0xs = sum(s0xsg.T @ fluxg)/flux
    s1xs = sum(s1xsg.T @ fluxg)/flux
    dxs = sum(dxsg * fluxg)/flux

    print('Diffusion: ')
    print('D: ', dxs)
    print('R: ', absxs)

    print('P1: ')
    print('sig0: ', totxs-s0xs)
    print('1/3/sig1: ', 1/3/(totxs-s1xs))


process_xs()