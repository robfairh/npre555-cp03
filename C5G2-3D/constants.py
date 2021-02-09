import numpy as np
import os
from os import path
import shutil


# This data was missing the groups self scattering
def material_properties():
    '''
    Cross-sections from Capilla. Applications of the multidimensional
    PL equations to complex fuel assembly problems. 2009.

    Returns:
    --------
    constants: [dictionary]
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
            - REMXS = removal cross-sections
            - NSF = production cross-sections
            - SP0 = scattering cross-sections
            - TOT = total cross-sections
    '''

    constants = {
        'uo2': {
             'DIFFCOEF': np.array([1.20, 0.40]),
             'REMXS': np.array([0.029656, 0.092659]),
             'NSF': np.array([0.00457, 0.11353]),
             # from S11, S12, S21, S22 (S11, S22 from mine/)
             'SP0': np.array([0.5417301, 0.02043, 0.00, 1.01730104])
            },

        'mox': {
             'DIFFCOEF': np.array([1.20, 0.40]),
             'REMXS': np.array([0.029655, 0.23164]),
             'NSF': np.array([0.0068524, 0.34450]),
             # from S11, S12, S21, S22 (S11, S22 from mine/)
             'SP0': np.array([0.56844291, 0.015864, 0.00, 0.92557093])
            },

        'reflec': {
                 'DIFFCOEF': np.array([1.20, 0.20]),
                 'REMXS': np.array([0.051, 0.04]),
                 'NSF': np.array([0.00, 0.00]),
                 # from S11, S12, S21, S22 (S11, S22 from mine/)
                 'SP0': np.array([0.56, 0.05, 0.00, 2.30])
               }
    }

    for mat in constants.keys():
        remxs = constants[mat]['REMXS']
        G = len(remxs)
        scatt = constants[mat]['SP0'].reshape(G, G)
        constants[mat]['TOT'] = remxs + scatt.diagonal()

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
    sp3: [bool]
        True if creating SP3 constants
    correct: [bool]
        True if applying transport correction to SP3 constants
    Returns:
    --------
    constants2: [dictionary]
        primary keys: name of the material
        secondary keys: constants required by Cerberus/Moltres
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
    into the Cerberus and moltres readable text files.

    Parameters:
    -----------
    outdir: [string]
        directory that will hold the cross-section files
    temp: [float]
        temperature at which the cross-sections were obtained
    materials: [dictionary]
        contains the cross-section informations
        primary keys: name of the material
        secondary keys: constants
    Return:
    -------
    None
    '''

    for currentMat in materials.keys():
        for data in materials[currentMat].keys():
            with open(outdir + '/' + currentMat +
                      '_' + data + '.txt', 'a') as fh:

                strData = materials[currentMat][data]
                strData = ' '.join(
                    [str(dat) for dat in strData]) if isinstance(
                    strData, np.ndarray) else str(strData)
                fh.write(str(temp) + ' ' + strData)
                fh.write('\n')
    return None


if __name__ == "__main__":
    temp = 300

    outdir = 'xs2g-homo'
    if os.path.exists(outdir):
        shutil.rmtree(outdir)
    os.mkdir(outdir)

    materials = material_properties()
    materials2 = prepare_xs(materials, sp3=True, correct=True)
    output_xs(outdir, temp, materials2)
