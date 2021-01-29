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
            - mox3 - P1 - 4.3% MOX Fuel (outer)
            - mox2 - P2 - 7.0% MOX Fuel
            - mox1 - P3 - 8.7% MOX Fuel (inner)
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
        
        # materials[mat]['trxs'] = sa + (1-mu)*ss
        materials[mat]['trxs'] = 1./3./data[mat]['D']

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

        with open(outdir + '/' + currentMat +
                  '_FISS.txt', 'a') as fh:

            strData = materials[currentMat]['nfxs']/2.4
            strData = ' '.join(
                [str(dat) for dat in strData]) if isinstance(
                strData, np.ndarray) else strData
            fh.write(str(temp) + ' ' + strData)
            fh.write('\n')

        with open(outdir + '/' + currentMat +
                  '_KAPPA.txt', 'a') as fh:

            strData = np.array([200, 200])
            strData = ' '.join(
                [str(dat) for dat in strData]) if isinstance(
                strData, np.ndarray) else strData
            fh.write(str(temp) + ' ' + strData)
            fh.write('\n')

        for coeff in ['CHIT', 'CHIP', 'CHID', 'INVV']:
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

        with open(outdir + '/' + currentMat +
                  '_FISS.txt', 'a') as fh:

            strData = materials[currentMat]['nfxs']/2.4
            strData = ' '.join(
                [str(dat) for dat in strData]) if isinstance(
                strData, np.ndarray) else strData
            fh.write(str(temp) + ' ' + strData)
            fh.write('\n')

        with open(outdir + '/' + currentMat +
                  '_KAPPA.txt', 'a') as fh:

            strData = np.array([200, 200])
            strData = ' '.join(
                [str(dat) for dat in strData]) if isinstance(
                strData, np.ndarray) else strData
            fh.write(str(temp) + ' ' + strData)
            fh.write('\n')

        for coeff in ['CHIT', 'CHIP', 'CHID', 'INVV']:
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


def update_dict(dictio, key, value):
    ''' updates dictionary by adding a key with an associated value
    '''
    dictio[key] = value
    return dictio

    # data = {


def uo2_properties():
    # UO2
    mat = {}
    value = np.array([1.20, 0.40])
    mat = update_dict(mat, 'diff', value)
    value = np.array([0.010, 0.100])
    mat = update_dict(mat, 'absxs', value)
    value = np.array([0.005, 0.125])
    mat = update_dict(mat, 'nsfxs', value)
    # from SR: S12, S21 and SS: S11, S22
    value = np.array([[0.54, 0.02], [0.00, 1.00]])
    value = np.reshape(value, 4)
    mat = update_dict(mat, 'scxs', value)
    value = np.array([1.0, 0.0])
    mat = update_dict(mat, 'chi', value)

    mat2 = prepare_xs(mat)
    return mat2


def mox1_properties():
    # mox1
    mat = {}
    value = np.array([1.20, 0.40])
    mat = update_dict(mat, 'diff', value)
    value = np.array([0.015, 0.300])
    mat = update_dict(mat, 'absxs', value)
    value = np.array([0.0075, 0.45])
    mat = update_dict(mat, 'nsfxs', value)
    # from SR: S12, S21 and SS: S11, S22
    value = np.array([[0.52, 0.015], [0.00, 0.76]])
    value = np.reshape(value, 4)
    mat = update_dict(mat, 'scxs', value)
    value = np.array([1.0, 0.0])
    mat = update_dict(mat, 'chi', value)

    mat2 = prepare_xs(mat)
    return mat2


def mox2_properties():
    # mox2
    mat = {}
    value = np.array([1.20, 0.40])
    mat = update_dict(mat, 'diff', value)
    value = np.array([0.015, 0.250])
    mat = update_dict(mat, 'absxs', value)
    value = np.array([0.0075, 0.375])
    mat = update_dict(mat, 'nsfxs', value)
    # from SR: S12, S21 and SS: S11, S22
    value = np.array([[0.52, 0.015], [0.00, 0.83]])
    value = np.reshape(value, 4)
    mat = update_dict(mat, 'scxs', value)
    value = np.array([1.0, 0.0])
    mat = update_dict(mat, 'chi', value)

    mat2 = prepare_xs(mat)
    return mat2


def mox3_properties():
    # mox3
    mat = {}
    value = np.array([1.20, 0.40])
    mat = update_dict(mat, 'diff', value)
    value = np.array([0.015, 0.200])
    mat = update_dict(mat, 'absxs', value)
    value = np.array([0.0075, 0.300])
    mat = update_dict(mat, 'nsfxs', value)
    # from SR: S12, S21 and SS: S11, S22
    value = np.array([[0.52, 0.015], [0.00, 0.90]])
    value = np.reshape(value, 4)
    mat = update_dict(mat, 'scxs', value)
    value = np.array([1.0, 0.0])
    mat = update_dict(mat, 'chi', value)

    mat2 = prepare_xs(mat)
    return mat2


def fission_properties():
    # fission
    mat = {}
    value = np.array([1.20, 0.40])
    mat = update_dict(mat, 'diff', value)
    value = np.array([0.001, 0.02])
    mat = update_dict(mat, 'absxs', value)
    value = np.array([1e-7, 3e-6])
    mat = update_dict(mat, 'nsfxs', value)
    # from SR: S12, S21 and SS: S11, S22
    value = np.array([[0.56, 0.025], [0.00, 1.20]])
    value = np.reshape(value, 4)
    mat = update_dict(mat, 'scxs', value)
    value = np.array([1.0, 0.0])
    mat = update_dict(mat, 'chi', value)

    mat2 = prepare_xs(mat)
    return mat2


def guide_properties():
    # guide
    mat = {}
    value = np.array([1.20, 0.40])
    mat = update_dict(mat, 'diff', value)
    value = np.array([0.001, 0.02])
    mat = update_dict(mat, 'absxs', value)
    # from SR: S12, S21 and SS: S11, S22
    value = np.array([[0.56, 0.025], [0.00, 1.20]])
    value = np.reshape(value, 4)
    mat = update_dict(mat, 'scxs', value)
    mat2 = prepare_xs(mat)
    return mat2


def reflector_properties():
    # reflector
    mat = {}
    value = np.array([1.20, 0.20])
    mat = update_dict(mat, 'diff', value)
    value = np.array([0.001, 0.04])
    mat = update_dict(mat, 'absxs', value)
    # from SR: S12, S21 and SS: S11, S22
    value = np.array([[0.56, 0.05], [0.00, 2.30]])
    value = np.reshape(value, 4)
    mat = update_dict(mat, 'scxs', value)

    mat2 = prepare_xs(mat)
    return mat2


def prepare_xs(mat):
    mat2 = {}

    G = len(mat['absxs'])
    remxs = mat['absxs'] + np.array([mat['scxs'][1], mat['scxs'][2]])

    mat2['DIFFCOEF'] = mat['diff']
    mat2['REMXS'] = remxs
    mat2['SP0'] = mat['scxs']
    try:
        mat2['NSF'] = mat['nsfxs']
    except KeyError:
        mat2['NSF'] = np.zeros(G)

    try:
        mat2['CHIT'] = mat['chi']
    except KeyError:
        mat2['CHIT'] = np.zeros(G)

    try:
        mat2['FISS'] = mat['nsfxs']/2.4
    except KeyError:
        mat2['FISS'] = np.zeros(G)

    mat2['KAPPA'] = np.ones(G) * 200
    mat2['CHIP'] = np.zeros(G)
    mat2['CHID'] = np.zeros(G)
    mat2['INVV'] = np.zeros(G)
    mat2['BETA_EFF'] = np.zeros(8)
    mat2['LAMBDA'] = np.zeros(8)

    return mat2


def output_xs(outdir, temp, materials):
    '''
    This function outputs the dictionary with the material cross-sections
    into the SP3 App readable format.

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


if __name__ == "__main__":
    temp = 300

    # # produces cross-sections for the heterogeneous case
    # outdir = 'xs2g'
    # if os.path.exists(outdir):
    #     shutil.rmtree(outdir)
    # os.mkdir(outdir)

    # materials = materials_het()
    # create_xs(outdir, temp, materials)
    # materials = materials_het_diag()
    # create_xs_diag(outdir, temp, materials)

    # # produces cross-sections for the homogeneous case
    # outdir = 'xs2g-homo'
    # materials = materials_hom()
    # create_xs(outdir, temp, materials)

    outdir = 'xs2g-m'
    if os.path.exists(outdir):
        shutil.rmtree(outdir)
    os.mkdir(outdir)

    materials = {}
    materials['uo2'] = uo2_properties()
    materials['mox1'] = mox1_properties()
    materials['mox2'] = mox2_properties()
    materials['mox3'] = mox3_properties()
    materials['fchamb'] = fission_properties()
    materials['gtub'] = guide_properties()
    materials['reflec'] = reflector_properties()
    output_xs(outdir, temp, materials)
