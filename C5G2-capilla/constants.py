import numpy as np


def materials_het():
    '''
    Cross-sections from Capilla. Applications of the multidimensional
    PL equations to complex fuel assembly problems. 2009.

    Returns:
    --------
    materials: [dictionary]
        dictionary that contains the materials and their respective
        cross-sections.
        * main keys:
        - mox1 = 8.7% MOX Fuel
        - mox2 = 7.0% MOX Fuel
        - mox3 = 4.3% MOX Fuel
        - uo2 - UO2 Fuel
        - gtub - Guide Tube
        - reflec - Reflector
        - fchamb - Moveable Fission Chamber
    '''

    materials = {
        'mox1': {
                'totxs': np.array([0.550, 1.060]),
                'nfxs': np.array([0.0075, 0.450]),
                'scxs': np.array([0.520, 0.015, 0, 0.76]),
               },

        'mox2': {
                'totxs': np.array([0.550, 1.01]),
                'nfxs': np.array([0.0075, 0.375]),
                'scxs': np.array([0.520, 0.015, 0, 0.76]),
               },

        'mox3': {
                'totxs': np.array([0.550, 1.100]),
                'nfxs': np.array([0.0075, 0.300]),
                'scxs': np.array([0.520, 0.015, 0, 0.90]),
               },

        'uo2': {
                'totxs': np.array([0.570, 1.100]),
                'nfxs': np.array([0.005, 0.125]),
                'scxs': np.array([0.540, 0.020, 0, 1.00]),
               },

        'gtub': {
                'totxs': np.array([0.586, 1.220]),
                'nfxs': np.array([0.00, 0.00]),
                'scxs': np.array([0.560, 0.025, 0, 1.20]),
               },

        'reflec': {
                'totxs': np.array([0.611, 2.340]),
                'nfxs': np.array([0.00, 0.00]),
                'scxs': np.array([0.560, 0.050, 0, 2.30]),
               },

        'fchamb': {
                'totxs': np.array([0.586, 1.220]),
                'nfxs': np.array([1e-7, 3e-6]),
                'scxs': np.array([0.560, 0.025, 0, 1.20]),
               }
    }

    return materials


def materials_hom():
    '''
    Cross-sections from Capilla. Applications of the multidimensional
    PL equations to complex fuel assembly problems. 2009.

    Returns:
    --------
    materials: [dictionary]
        dictionary that contains the materials and their respective
        cross-sections.
    '''

    mu1 = np.array([1.013854, 0.996026])
    mu1b = np.concatenate((mu1, mu1))
    mu2 = np.array([1.003107, 0.999433])
    mu2b = np.concatenate((mu2, mu2))

    materials = {
        'mox': {
             'totxs': np.array([0.553087, 1.068911]) * mu1,
             'nfxs': np.array([0.006857, 0.340391]) * mu1,
             'scxs': np.array([0.523430, 0.016089, 0, 0.839806]) * mu1b
            },

        'uo2': {
             'totxs': np.array([0.571360, 1.111391]) * mu2,
             'nfxs': np.array([0.004575, 0.113135]) * mu2,
             'scxs': np.array([0.541700, 0.020475, 0, 1.018984]) * mu2b
            },

        'reflec': {
                 'totxs': np.array([0.611, 2.340]),
                 'nfxs': np.array([0.00, 0.00]),
                 'scxs': np.array([0.560, 0.050, 0, 2.30])
               }
    }

    return materials


def create_xs(outdir, temp, materials):
    '''
    This function outputs the dictionary with the material cross-sections
    into the SP3 App readable format.

    '''

    for currentMat in materials.keys():

        remxs = materials[currentMat]['totxs'] - \
            materials[currentMat]['scxs'].reshape((2, 2)).diagonal()

        with open(outdir + '/' + currentMat +
                  '_DIFFCOEFA.txt', 'a') as fh:

            strData = 1./3./materials[currentMat]['totxs']
            strData = ' '.join(
                [str(dat) for dat in strData]) if isinstance(
                strData, np.ndarray) else strData
            fh.write(str(temp) + ' ' + strData)
            fh.write('\n')

        with open(outdir + '/' + currentMat +
                  '_DIFFCOEFB.txt', 'a') as fh:

            strData = 9./35./materials[currentMat]['totxs']
            strData = ' '.join(
                [str(dat) for dat in strData]) if isinstance(
                strData, np.ndarray) else strData
            fh.write(str(temp) + ' ' + strData)
            fh.write('\n')

        with open(outdir + '/' + currentMat +
                  '_REMXSA.txt', 'a') as fh:

            strData = remxs
            strData = ' '.join(
                [str(dat) for dat in strData]) if isinstance(
                strData, np.ndarray) else strData
            fh.write(str(temp) + ' ' + strData)
            fh.write('\n')

        with open(outdir + '/' + currentMat +
                  '_REMXSB.txt', 'a') as fh:

            strData = materials[currentMat]['totxs'] + 4./5 * remxs
            strData = ' '.join(
                [str(dat) for dat in strData]) if isinstance(
                strData, np.ndarray) else strData
            fh.write(str(temp) + ' ' + strData)
            fh.write('\n')

        with open(outdir + '/' + currentMat +
                  '_COUPLEXSA.txt', 'a') as fh:

            strData = 2 * remxs
            strData = ' '.join(
                [str(dat) for dat in strData]) if isinstance(
                strData, np.ndarray) else strData
            fh.write(str(temp) + ' ' + strData)
            fh.write('\n')

        with open(outdir + '/' + currentMat +
                  '_COUPLEXSB.txt', 'a') as fh:

            strData = 2./5 * remxs
            strData = ' '.join(
                [str(dat) for dat in strData]) if isinstance(
                strData, np.ndarray) else strData
            fh.write(str(temp) + ' ' + strData)
            fh.write('\n')

        with open(outdir + '/' + currentMat +
                  '_NSF.txt', 'a') as fh:

            strData = materials[currentMat]['nfxs']
            strData = ' '.join(
                [str(dat) for dat in strData]) if isinstance(
                strData, np.ndarray) else strData
            fh.write(str(temp) + ' ' + strData)
            fh.write('\n')

        with open(outdir + '/' + currentMat +
                  '_SP0.txt', 'a') as fh:

            strData = materials[currentMat]['scxs']
            strData = ' '.join(
                [str(dat) for dat in strData]) if isinstance(
                strData, np.ndarray) else strData
            fh.write(str(temp) + ' ' + strData)
            fh.write('\n')

        for coeff in ['CHIT', 'CHIP', 'CHID', 'FISS', 'KAPPA', 'INVV']:
            with open(outdir + '/' + currentMat +
                      '_' + coeff + '.txt', 'a') as fh:

                strData = np.array([1, 0])
                strData = ' '.join(
                    [str(dat) for dat in strData]) if isinstance(
                    strData, np.ndarray) else strData
                fh.write(str(temp) + ' ' + strData)
                fh.write('\n')

        for coefficient in ['BETA_EFF', 'lambda']:
            with open(outdir + '/' + currentMat +
                      '_' + coefficient.upper() + '.txt', 'a') as fh:

                strData = np.array([0, 0, 0, 0, 0, 0, 0, 0])
                strData = ' '.join(
                    [str(dat) for dat in strData]) if isinstance(
                    strData, np.ndarray) else strData
                fh.write(str(temp) + ' ' + strData)
                fh.write('\n')


if __name__ == "__main__":
    temp = 300

    # produces cross-sections for the heterogeneous case
    outdir = 'xs2g'
    materials = materials_het()
    create_xs(outdir, temp, materials)

    # produces cross-sections for the homogeneous case
    outdir = 'xs2g-homo'
    materials = materials_hom()
    create_xs(outdir, temp, materials)
