import numpy as np
import os
from os import path
import shutil


def materials_het():
    '''
    Cross-sections from Cavarec et al. Benchmark Calculations
    of Power Distributions within Assemblies. 1994.

    Returns:
    --------
    materials: [dictionary]
        dictionary that contains the materials and their respective
        cross-sections.
        * main keys:
            - uo2 - U - UO2 Fuel
            - mox3 - P1 - 4.3% MOX Fuel
            - mox2 - P2 - 7.0% MOX Fuel
            - mox1 - P3 - 8.7% MOX Fuel
            - gtub - X - Guide Tube
            - reflec - R - Reflector
            - fchamb - C - Moveable Fission Chamber

        * secondary keys:
            - D = difffusion coefficients
            - SA = absorption cross-sections
            - SR = removal scattering = [s12, s21]
            - NSF = production cross-sections
            - SS = self-scattering = [s11, s22]
    '''

    data = {
        'mox1': {
                'D': np.array([1.20, 0.40]),
                'SA': np.array([0.015, 0.300]),
                'SR': np.array([0.015, 0.]),
                'NSF': np.array([0.0075, 0.45]),
                'SS': np.array([0.52, 0.76]),
               },
        'mox2': {
                'D': np.array([1.20, 0.40]),
                'SA': np.array([0.015, 0.250]),
                'SR': np.array([0.015, 0.]),
                'NSF': np.array([0.0075, 0.375]),
                'SS': np.array([0.52, 0.83]),
               },
        'mox3': {
                'D': np.array([1.20, 0.40]),
                'SA': np.array([0.015, 0.200]),
                'SR': np.array([0.015, 0.]),
                'NSF': np.array([0.0075, 0.300]),
                'SS': np.array([0.52, 0.90]),
               },
        'uo2': {
                'D': np.array([1.20, 0.40]),
                'SA': np.array([0.010, 0.100]),
                'SR': np.array([0.02, 0.]),
                'NSF': np.array([0.005, 0.125]),
                'SS': np.array([0.54, 1.00]),
               },
        'gtub': {
                'D': np.array([1.20, 0.40]),
                'SA': np.array([0.001, 0.02]),
                'SR': np.array([0.025, 0.]),
                'NSF': np.array([0., 0.]),
                'SS': np.array([0.56, 1.20]),
               },
        'reflec': {
                'D': np.array([1.20, 0.20]),
                'SA': np.array([0.001, 0.04]),
                'SR': np.array([0.05, 0.]),
                'NSF': np.array([0., 0.]),
                'SS': np.array([0.56, 2.30]),
               },
        'fchamb': {
                'D': np.array([1.20, 0.40]),
                'SA': np.array([0.001, 0.02]),
                'SR': np.array([0.025, 0.]),
                'NSF': np.array([1e-7, 3e-6]),
                'SS': np.array([0.56, 1.20]),
               }
    }

    materials = {}
    for mat in data:
        materials[mat] = {}

        # tot xs
        sa = data[mat]['SA']
        ss = data[mat]['SS']
        sr = data[mat]['SR']
        stot = sa + ss + sr
        materials[mat]['totxs'] = stot

        # nf xs
        materials[mat]['nfxs'] = data[mat]['NSF']

        # scatt xs: SP0
        ss = data[mat]['SS']
        sr = data[mat]['SR']

        materials[mat]['scxs'] = np.zeros(4)
        materials[mat]['scxs'][0] = ss[0]
        materials[mat]['scxs'][1] = sr[0]
        materials[mat]['scxs'][2] = sr[1]
        materials[mat]['scxs'][3] = ss[1]

    for mat in materials:
        print(materials[mat]['totxs'])

    print()
    for mat in materials:
        print(materials[mat]['nfxs'])

    print()
    for mat in materials:
        print(materials[mat]['scxs'])

    return materials


def materials_het_diag():
    '''
    Cross-sections from Cavarec et al. Benchmark Calculations
    of Power Distributions within Assemblies. 1994.
    Applies the diagonal transport correction.

    # diagonal transport correction (for each group):
    # str = sa + (1-mu)*ss
    # ss* = ss + (STR-STOT)

    Returns:
    --------
    materials: [dictionary]
        dictionary that contains the materials and their respective
        cross-sections.
        * main keys:
            - uo2 - U - UO2 Fuel
            - mox3 - P1 - 4.3% MOX Fuel
            - mox2 - P2 - 7.0% MOX Fuel
            - mox1 - P3 - 8.7% MOX Fuel
            - gtub - X - Guide Tube
            - reflec - R - Reflector
            - fchamb - C - Moveable Fission Chamber

        * secondary keys:
            - D = difffusion coefficients
            - SA = absorption cross-sections
            - SR = removal scattering = [s12, s21]
            - NSF = production cross-sections
            - SS = self-scattering = [s11, s22]
    '''

    data = {
        'uo2': {
                'D': np.array([1.20, 0.40]),
                'SA': np.array([0.010, 0.100]),
                'SR': np.array([0.02, 0.]),
                'NSF': np.array([0.005, 0.125]),
                'SS': np.array([0.54, 1.00]),
               },
        'mox3': {
                'D': np.array([1.20, 0.40]),
                'SA': np.array([0.015, 0.200]),
                'SR': np.array([0.015, 0.]),
                'NSF': np.array([0.0075, 0.300]),
                'SS': np.array([0.52, 0.90]),
               },
        'mox2': {
                'D': np.array([1.20, 0.40]),
                'SA': np.array([0.015, 0.250]),
                'SR': np.array([0.015, 0.]),
                'NSF': np.array([0.0075, 0.375]),
                'SS': np.array([0.52, 0.83]),
               },
        'mox1': {
                'D': np.array([1.20, 0.40]),
                'SA': np.array([0.015, 0.300]),
                'SR': np.array([0.015, 0.]),
                'NSF': np.array([0.0075, 0.45]),
                'SS': np.array([0.52, 0.76]),
               },
        'gtub': {
                'D': np.array([1.20, 0.40]),
                'SA': np.array([0.001, 0.02]),
                'SR': np.array([0.025, 0.]),
                'NSF': np.array([0., 0.]),
                'SS': np.array([0.56, 1.20]),
               },
        'reflec': {
                'D': np.array([1.20, 0.20]),
                'SA': np.array([0.001, 0.04]),
                'SR': np.array([0.05, 0.]),
                'NSF': np.array([0., 0.]),
                'SS': np.array([0.56, 2.30]),
               },
        'fchamb': {
                'D': np.array([1.20, 0.40]),
                'SA': np.array([0.001, 0.02]),
                'SR': np.array([0.025, 0.]),
                'NSF': np.array([1e-7, 3e-6]),
                'SS': np.array([0.56, 1.20]),
               }
    }

    materials = {}
    for mat in data:
        materials[mat] = {}

        # tot xs
        sa = data[mat]['SA']
        ss = data[mat]['SS']
        sr = data[mat]['SR']
        stot = sa + ss + sr
        materials[mat]['totxs'] = stot

        # nf xs
        materials[mat]['nfxs'] = data[mat]['NSF']

        # transport correction
        sa = data[mat]['SA']
        ss = data[mat]['SS']
        mu = np.array([0.5, 0.3])
        materials[mat]['trxs'] = sa + (1-mu)*ss

        # scatt xs: SP0
        ss = data[mat]['SS']
        sr = data[mat]['SR']

        materials[mat]['scxs'] = np.zeros(4)
        materials[mat]['scxs'][0] = ss[0]
        materials[mat]['scxs'][1] = sr[0]
        materials[mat]['scxs'][2] = sr[1]
        materials[mat]['scxs'][3] = ss[1]

    # str = sa + (1-mu)*ss
    # ss* = ss + (STR-STOT)

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


def create_xs_diag(outdir, temp, materials):
    '''
    This function outputs the dictionary with the material cross-sections
    into the SP3 App readable format.

    '''

    for currentMat in materials.keys():

        remxs = materials[currentMat]['totxs'] - \
            materials[currentMat]['scxs'].reshape((2, 2)).diagonal()

        with open(outdir + '/' + currentMat +
                  '_DIFFCOEFA.txt', 'a') as fh:

            strData = 1./3./materials[currentMat]['trxs']
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
    if os.path.exists(outdir):
        shutil.rmtree(outdir)
    os.mkdir(outdir)
    # materials = materials_het()
    # create_xs(outdir, temp, materials)
    materials = materials_het_diag()
    create_xs_diag(outdir, temp, materials)

    # # produces cross-sections for the homogeneous case
    # outdir = 'xs2g-homo'
    # materials = materials_hom()
    # create_xs(outdir, temp, materials)

    # materials_het()
