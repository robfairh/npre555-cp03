import numpy as np
import os
import shutil


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

    constants = {
        'mox1': {
                'TOT': np.array([0.550, 1.060]),
                'NSF': np.array([0.0075, 0.450]),
                'SP0': np.array([0.520, 0.015, 0, 0.76]),
               },

        'mox2': {
                'TOT': np.array([0.550, 1.01]),
                'NSF': np.array([0.0075, 0.375]),
                'SP0': np.array([0.520, 0.015, 0, 0.76]),
               },

        'mox3': {
                'TOT': np.array([0.550, 1.100]),
                'NSF': np.array([0.0075, 0.300]),
                'SP0': np.array([0.520, 0.015, 0, 0.90]),
               },

        'uo2': {
                'TOT': np.array([0.570, 1.100]),
                'NSF': np.array([0.005, 0.125]),
                'SP0': np.array([0.540, 0.020, 0, 1.00]),
               },

        'gtub': {
                'TOT': np.array([0.586, 1.220]),
                'NSF': np.array([0.00, 0.00]),
                'SP0': np.array([0.560, 0.025, 0, 1.20]),
               },

        'reflec': {
                'TOT': np.array([0.611, 2.340]),
                'NSF': np.array([0.00, 0.00]),
                'SP0': np.array([0.560, 0.050, 0, 2.30]),
               },

        'fchamb': {
                'TOT': np.array([0.586, 1.220]),
                'NSF': np.array([1e-7, 3e-6]),
                'SP0': np.array([0.560, 0.025, 0, 1.20]),
               }
    }

    constants2 = prepare_xs(constants)

    return constants2


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

    constants = {
        'mox': {
             'TOT': np.array([0.553087, 1.068911]) * mu1,
             'NSF': np.array([0.006857, 0.340391]) * mu1,
             'SP0': np.array([0.523430, 0.016089, 0, 0.839806]) * mu1b
            },

        'uo2': {
             'TOT': np.array([0.571360, 1.111391]) * mu2,
             'NSF': np.array([0.004575, 0.113135]) * mu2,
             'SP0': np.array([0.541700, 0.020475, 0, 1.018984]) * mu2b
            },

        'reflec': {
                 'TOT': np.array([0.611, 2.340]),
                 'NSF': np.array([0.00, 0.00]),
                 'SP0': np.array([0.560, 0.050, 0, 2.30])
               }
    }

    constants2 = prepare_xs(constants)

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

    # creates cross-sections for the heterogeneous case
    outdir = 'xs2g-het'
    if os.path.exists(outdir):
        shutil.rmtree(outdir)
    os.mkdir(outdir)

    materials = materials_het()
    output_xs(outdir, temp, materials)

    # creates cross-sections for the homogeneous case
    outdir = 'xs2g-homo'
    if os.path.exists(outdir):
        shutil.rmtree(outdir)
    os.mkdir(outdir)

    materials = materials_hom()
    output_xs(outdir, temp, materials)
