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
            - DIFFCOEF = difffusion coefficients
            - ABS = absorption cross-sections
            - NSF = production cross-sections
            - SP0 = scattering cross-sections 
    '''

    constants = {
        'mox1': {
                'DIFFCOEF': np.array([1.20, 0.40]),
                'ABS': np.array([0.015, 0.300]),
                'NSF': np.array([0.0075, 0.45]),
                # combines SS and SR: SS1, SR1, SR2, SS2
                'SP0': np.array([0.52, 0.015, 0.0, 0.76]),
                },
        'mox2': {
                'DIFFCOEF': np.array([1.20, 0.40]),
                'ABS': np.array([0.015, 0.250]),
                'NSF': np.array([0.0075, 0.375]),
                # combines SS and SR: SS1, SR1, SR2, SS2
                'SP0': np.array([0.52, 0.015, 0.0, 0.83]),
               },
        'mox3': {
                'DIFFCOEF': np.array([1.20, 0.40]),
                'ABS': np.array([0.015, 0.200]),
                'NSF': np.array([0.0075, 0.300]),
                # combines SS and SR: SS1, SR1, SR2, SS2
                'SP0': np.array([0.52, 0.015, 0.0, 0.90]),
               },
        'uo2': {
                'DIFFCOEF': np.array([1.20, 0.40]),
                'ABS': np.array([0.010, 0.100]),
                'NSF': np.array([0.005, 0.125]),
                # combines SS and SR: SS1, SR1, SR2, SS2
                'SP0': np.array([0.54, 0.02, 0.0, 1.00]),
               },
        'gtub': {
                'DIFFCOEF': np.array([1.20, 0.40]),
                'ABS': np.array([0.001, 0.02]),
                'NSF': np.array([0., 0.]),
                # combines SS and SR: SS1, SR1, SR2, SS2
                'SP0': np.array([0.56, 0.025, 0.0, 1.20]),
               },
        'fchamb': {
                'DIFFCOEF': np.array([1.20, 0.40]),
                'ABS': np.array([0.001, 0.02]),
                'NSF': np.array([1e-7, 3e-6]),
                # combines SS and SR: SS1, SR1, SR2, SS2
                'SP0': np.array([0.56, 0.025, 0.0, 1.20]),
               },
        'reflec': {
                'DIFFCOEF': np.array([1.20, 0.20]),
                'ABS': np.array([0.001, 0.04]),
                'NSF': np.array([0., 0.]),
                # combines SS and SR: SS1, SR1, SR2, SS2
                'SP0': np.array([0.56, 0.05, 0.0, 2.30]),
               }
    }

    for mat in constants.keys():
        absxs = constants[mat]['ABS']
        G = len(absxs)
        scatt = constants[mat]['SP0'].reshape(G, G)
        constants[mat]['TOT'] = absxs + np.sum(scatt, axis=1)

    return constants


def prepare_xs(constants, sp3=True, correct=False):
    '''
    This function prepares the cross-sections and outputs a dictionary
    with all the information required by Cerberus.

    Parameters:
    ----------
    constants: [dictionary]
        cross-section data
        primary keys: name of the material
        secondary keys: constants
    Returns:
    --------
    constants2: [dictionary]
        primary keys: name of the material
        secondary keys: constants required by Cerberus
    '''

    constants2 = {}
    for mat in constants.keys():
        G = len(constants[mat]['TOT'])
        totxs = constants[mat]['TOT']
        try:
            s0xs = constants[mat]['SP0']
        except KeyError:
            s0xs = np.zeros(G*G)
        try:
            s1xs = constants[mat]['SP1']
        except KeyError:
            s1xs = np.zeros(G*G)
        try:
            s2xs = constants[mat]['SP2']
        except KeyError:
            s2xs = np.zeros(G*G)
        try:
            s3xs = constants[mat]['SP3']
        except KeyError:
            s3xs = np.zeros(G*G)

        rem0xs = totxs - s0xs.reshape(G, G).diagonal()
        rem1xs = totxs - s1xs.reshape(G, G).diagonal()
        rem2xs = totxs - s2xs.reshape(G, G).diagonal()
        rem3xs = totxs - s3xs.reshape(G, G).diagonal()

        constants2[mat] = {}
        constants2[mat]['BETA_EFF'] = np.zeros(8)
        constants2[mat]['CHID'] = np.zeros(G)
        constants2[mat]['CHIP'] = np.zeros(G)
        constants2[mat]['CHIT'] = np.zeros(G)
        constants2[mat]['CHIT'][0] = 1.
        try:
            constants2[mat]['FISS'] = constants[mat]['FISS']
        except KeyError:
            constants2[mat]['FISS'] = constants[mat]['NSF']/2.4
        constants2[mat]['INVV'] = np.zeros(G)
        constants2[mat]['KAPPA'] = 200*np.ones(G)
        constants2[mat]['LAMBDA'] = np.zeros(8)
        try:
            constants2[mat]['NSF'] = constants[mat]['NSF']
        except KeyError:
            constants2[mat]['NSF'] = np.zeros(G)
        constants2[mat]['SP0'] = s0xs

        if sp3 is True:
            if correct is True:
                try:
                    constants2[mat]['DIFFCOEFA'] = 1./3/constants[mat]['TRXS']
                except KeyError:
                    constants2[mat]['DIFFCOEFA'] = constants[mat]['DIFFCOEF']
            else:
                constants2[mat]['DIFFCOEFA'] = 1./3/rem1xs
            constants2[mat]['DIFFCOEFB'] = 9./35/rem3xs
            constants2[mat]['REMXSA'] = rem0xs
            constants2[mat]['REMXSB'] = rem2xs + 4./5*rem0xs
            constants2[mat]['COUPLEXSA'] = 2*rem0xs
            constants2[mat]['COUPLEXSB'] = 2./5*rem0xs
        else:
            constants2[mat]['DIFFCOEF'] = constants[mat]['DIFFCOEF']
            constants2[mat]['REMXS'] = rem0xs

    return constants2


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

    # creates cross-sections for Cerberus
    # sp3 no transport correction
    outdir = 'xs2g'
    if os.path.exists(outdir):
        shutil.rmtree(outdir)
    os.mkdir(outdir)

    materials = materials_het()
    materials2 = prepare_xs(materials, sp3=True)
    output_xs(outdir, temp, materials2)

    # creates cross-sections for Cerberus
    # sp3 with transport correction
    outdir = 'xs2g-correct'
    if os.path.exists(outdir):
        shutil.rmtree(outdir)
    os.mkdir(outdir)

    materials = materials_het()
    materials2 = prepare_xs(materials, sp3=True, correct=True)
    output_xs(outdir, temp, materials2)

    # creates cross-sections for Moltres
    outdir = 'xs2g-m'
    if os.path.exists(outdir):
        shutil.rmtree(outdir)
    os.mkdir(outdir)

    materials = {}
    materials = materials_het()
    materials2 = prepare_xs(materials, sp3=False)
    output_xs(outdir, temp, materials2)
