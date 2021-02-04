import numpy as np
import os
from os import path
import shutil


def materials_het():
    '''
    Cross-sections from Brantley and Larsen. The Simplified P3
    Approximation. 2000.

    Returns:
    --------
    materials: [dictionary]
        dictionary that contains the materials and their respective
        cross-sections.
        * main keys: materials (fuel, moderator)
        * secondary keys: constants (totxs, nsf, scxs)
    '''

    constants = {
        'fuel': {
                'TOT': np.array([1.5]),
                'NSF': np.array([0.24]),
                'SP0': np.array([1.35]),
                },
        'moderator': {
                'TOT': np.array([1.0]),
                'NSF': np.array([0.0]),
                'SP0': np.array([0.93]),
                     },
    }

    constants2 = prepare_xs(constants)

    return constants2


def prepare_xs(constants):
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
        constants2[mat]['COUPLEXSA'] = 2*rem0xs
        constants2[mat]['COUPLEXSB'] = 2./5*rem0xs
        constants2[mat]['DIFFCOEFA'] = 1./3/rem1xs
        constants2[mat]['DIFFCOEFB'] = 9./35/rem3xs
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
        constants2[mat]['REMXSA'] = rem0xs
        constants2[mat]['REMXSB'] = rem2xs + 4./5*rem0xs
        constants2[mat]['SP0'] = s0xs

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

    # produces cross-sections for the heterogeneous case
    outdir = 'xs'
    if os.path.exists(outdir):
        shutil.rmtree(outdir)
    os.mkdir(outdir)
    materials = materials_het()
    output_xs(outdir, temp, materials)
