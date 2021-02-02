import numpy as np


def process_xs1g_diff(constants):
    '''
    This function prints in the terminal the values of the cross-sections.
    '''

    flux = sum(constants['fluxg'])
    dxs = sum(constants['dxsg'] * constants['fluxg'])/flux
    totxs = sum(constants['totxsg'] * constants['fluxg'])/flux
    s0xs = sum(constants['s0xsg'].T @ constants['fluxg'])/flux
    nfxs = sum(constants['nfxsg'] * constants['fluxg'])/flux
    fxs = sum(constants['fxsg'] * constants['fluxg'])/flux

    print('Diffusion: ')
    print('D: ', dxs)
    print('Sigma_R: ', totxs-s0xs)
    print('nuSigma_f: ', nfxs)
    print('Sigma_f: ', fxs)


def process_xs1g_sp3(constants):
    '''
    This function prints in the terminal the values of the cross-sections.
    '''

    flux = sum(constants['fluxg'])
    totxs = sum(constants['totxsg'] * constants['fluxg'])/flux
    s0xs = sum(constants['s0xsg'].T @ constants['fluxg'])/flux
    s1xs = sum(constants['s1xsg'].T @ constants['fluxg'])/flux
    s2xs = sum(constants['s2xsg'].T @ constants['fluxg'])/flux
    s3xs = sum(constants['s3xsg'].T @ constants['fluxg'])/flux

    print('Equation 1:')
    print('D_0: ', 1./3/(totxs-s1xs))
    print('Sigma_{r,0}: ', totxs-s0xs)
    print('2 * Sigma_{r,0}: ', 2*(totxs-s0xs))
    print()

    print('Equation 2:')
    print('D_2: ', 9./35/(totxs-s3xs))
    print('Sigma_{r,2} + 4/5 * Sigma_{r,0}: ', totxs-s2xs+4/5*(totxs-s0xs))
    print('2/5 * Sigma_{r,0}: ', 2/5*(totxs-s0xs))


def output_xs(outdir, temp, materials):
    '''
    This function outputs the dictionary with the material cross-sections
    into the Cerberus and Moltres readable format.

    '''
    for currentMat in materials.keys():
        for data in materials[currentMat].keys():

            with open(outdir + '/' + currentMat +
                      '_' + data + '.txt', 'a') as fh:

                strData = materials[currentMat][data]
                strData = ' '.join(
                    [str(dat) for dat in strData]) if isinstance(
                    strData, np.ndarray) else strData
                fh.write(str(temp) + ' ' + strData)
                fh.write('\n')


if __name__ == '__main__':
    '''
    Cross-sections from 'fullcore3G-LBP.coe' - 9 176 (fuel).

    '''

    # constants = {
    #     # INF_FLX
    #     'fluxg': np.array([1.41871E+21, 3.82855E+21, 1.09417E+21]),
    #     # INF_TOT
    #     'totxsg': np.array([2.07015E-01, 3.42755E-01, 3.63852E-01]),
    #     # INF_S0
    #     's0xsg': np.array([[1.93112E-01, 1.37674E-02, 0.00000E+00],
    #                       [0.00000E+00, 3.36889E-01, 3.36605E-03],
    #                       [0.00000E+00, 3.59504E-03, 3.48004E-01]]),
    #     # INF_S1
    #     's1xsg': np.array([[2.53397E-02, -3.82909E-03, 0.00000E+00],
    #                       [0.00000E+00, 2.03290E-02, -7.86728E-04],
    #                       [0.00000E+00, -3.66985E-04, 1.15004E-02]]),
    #     # INF_S2
    #     's2xsg': np.array([[7.57813E-03, -4.11248E-04, 0.00000E+00],
    #                       [0.00000E+00,  5.59584E-04, -1.31772E-04],
    #                       [0.00000E+00, -2.56299E-04, -4.10279E-03]]),
    #     # INF_S3
    #     's3xsg': np.array([[1.59804E-03, -1.95413E-05, 0.00000E+00],
    #                        [0.00000E+00, 3.60070E-05, -3.44863E-05],
    #                        [0.00000E+00, -9.44644E-05, -3.90118E-03]]),
    #     # INF_DIFFCOEF
    #     'dxsg': np.array([1.99474E+00, 1.03279E+00, 9.49027E-01]),
    #     # FISSXS
    #     'fxsg': np.array([8.33511E-05, 6.25616E-04, 7.57266E-03]),
    #     # NSF
    #     'nfxsg': np.array([2.21190E-04, 1.52254E-03, 1.84485E-02]),
    #     # ABSXS
    #     'absxsg': np.array([1.35139E-04, 2.50001E-03, 1.22535E-02])
    # }

    # process_xs1g_diff(constants)
    # process_xs1g_sp3(constants)

    
