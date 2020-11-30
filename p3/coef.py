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

# fullcore3G-LBP.coe
# 9 176 (fuel)

# INF_FLX
fluxg = np.array([1.41871E+21, 3.82855E+21, 1.09417E+21])

# INF_TOT
totxsg = np.array([2.07015E-01, 3.42755E-01, 3.63852E-01])

# INF_S0
s0xsg = np.array([[1.93112E-01, 1.37674E-02, 0.00000E+00],
                 [0.00000E+00, 3.36889E-01, 3.36605E-03],
                 [0.00000E+00, 3.59504E-03, 3.48004E-01]])

# INF_S1
s1xsg = np.array([[2.53397E-02, -3.82909E-03, 0.00000E+00],
                 [0.00000E+00, 2.03290E-02, -7.86728E-04],
                 [0.00000E+00, -3.66985E-04, 1.15004E-02]])

# INF_S2
s2xsg = np.array([[7.57813E-03, -4.11248E-04, 0.00000E+00],
                  [0.00000E+00,  5.59584E-04, -1.31772E-04],
                  [0.00000E+00, -2.56299E-04, -4.10279E-03]])

# INF_S3
s3xsg = np.array([[1.59804E-03, -1.95413E-05, 0.00000E+00],
                  [0.00000E+00, 3.60070E-05, -3.44863E-05],
                  [0.00000E+00, -9.44644E-05, -3.90118E-03]])

# INF_DIFFCOEF
dxsg = np.array([1.99474E+00, 1.03279E+00, 9.49027E-01])

# INF_DIFFCOEF
dxsg = np.array([1.99474E+00, 1.03279E+00, 9.49027E-01])


def process_1g_xs():
    flux = sum(fluxg)
    totxs = sum(totxsg * fluxg)/flux

    s0xs = sum(s0xsg.T @ fluxg)/flux
    s1xs = sum(s1xsg.T @ fluxg)/flux
    s2xs = sum(s2xsg.T @ fluxg)/flux
    s3xs = sum(s3xsg.T @ fluxg)/flux

    print('Equation 1:')
    print('D_0: ', 1./3/(totxs-s1xs))
    print('Sigma_{r,0}: ', totxs-s0xs)
    print('2 * Sigma_{r,0}: ', 2*(totxs-s0xs))
    print()

    print('Equation 2:')
    print('D_2: ', 9./35/(totxs-s3xs))
    print('Sigma_{r,2} + 4/5 * Sigma_{r,0}: ', totxs-s2xs+4/5*(totxs-s0xs))
    print('2/5 * Sigma_{r,0}: ', 2/5*(totxs-s0xs))


def process_3g_xs():
    print('Equation 1:')
    print('D_0: ', 1./3/(totxsg-s1xsg.diagonal()))
    print('Sigma_{r,0}: ', totxsg-s0xsg.diagonal())
    print('2 * Sigma_{r,0}: ', 2*(totxsg-s0xsg.diagonal()))
    print('Sigma_{s,0}: ', s0xsg)
    print()

    print('Equation 2:')
    print('D_2: ', 9./35/(totxsg-s3xsg.diagonal()))
    print('Sigma_{r,2} + 4/5 * Sigma_{r,0}: ', totxsg-s2xsg.diagonal()+4/5*(totxsg-s0xsg.diagonal()))
    print('2/5 * Sigma_{r,0}: ', 2/5*(totxsg-s0xsg.diagonal()))
    print('2/5 * Sigma_{s,0}: ', 2/5*s0xsg)


process_3g_xs()
