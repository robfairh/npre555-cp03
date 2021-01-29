import numpy as np
import os
from os import path
import shutil

# This data is missing the groups self scattering


def update_dict(dictio, key, value):
    ''' updates dictionary by adding a key with an associated value
    '''
    dictio[key] = value
    return dictio


def uo2_properties():
    ''' Cross-sections from Ryu and Joo. Finite element method solution of the
    simplified P3 equations for general geometry applications. 2012.
    '''

    # uo2
    mat = {}
    value = np.array([1.20, 0.40])
    mat = update_dict(mat, 'diff', value)
    value = np.array([0.029656, 0.092659])
    mat = update_dict(mat, 'remxs', value)
    value = np.array([0.00457, 0.11353])
    mat = update_dict(mat, 'nsfxs', value)
    # from S12, S21
    value = np.array([0.02043, 0.00])
    mat = update_dict(mat, 'ssxs', value)
    value = np.array([1.0, 0.0])
    mat = update_dict(mat, 'chi', value)

    mat2 = prepare_xs(mat)
    return mat2


def mox_properties():
    # mox
    mat = {}
    value = np.array([1.20, 0.40])
    mat = update_dict(mat, 'diff', value)
    value = np.array([0.029655, 0.23164])
    mat = update_dict(mat, 'remxs', value)
    value = np.array([0.0068524, 0.34450])
    mat = update_dict(mat, 'nsfxs', value)
    # from S12, S21
    value = np.array([0.015864, 0.00])
    mat = update_dict(mat, 'ssxs', value)
    value = np.array([1.0, 0.0])
    mat = update_dict(mat, 'chi', value)

    mat2 = prepare_xs(mat)
    return mat2


def reflector_properties():
    # reflector
    mat = {}
    value = np.array([1.20, 0.20])
    mat = update_dict(mat, 'diff', value)
    value = np.array([0.051, 0.04])
    mat = update_dict(mat, 'remxs', value)
    # from S12, S21
    value = np.array([0.05, 0.00])
    mat = update_dict(mat, 'ssxs', value)

    mat2 = prepare_xs(mat)
    return mat2


def prepare_xs(mat):
    mat2 = {}

    G = len(mat['diff'])

    totxs = 
    sp0 = 

    # mat2['DIFFCOEFA'] = 1./3./mat['totxs']
    mat2['DIFFCOEFA'] = mat1['diff']

    mat2['DIFFCOEFB'] = 9./35./totxs
    mat2['REMXSA'] = mat['remxs']
    mat2['REMXSB'] = totxs + 4./5 * mat['remxs']
    mat2['COUPLEXSA'] = 2 * mat['remxs']
    mat2['COUPLEXSB'] = 2./5 * mat['remxs']
    mat2['SP0'] = sp0

    try:
        mat2['NSF'] = mat['nsfxs']
    except KeyError:
        mat2['NSF'] = np.zeros(G)

    try:
        mat2['CHIT'] = mat['chi']
    except KeyError:
        mat2['CHIT'] = np.zeros(G)

    try:
        mat2['FISS'] = mat['nsfxs'] / 2.4
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

    outdir = 'xs2g-homo'
    if os.path.exists(outdir):
        shutil.rmtree(outdir)
    os.mkdir(outdir)

    materials = {}
    materials['uo2'] = uo2_properties()
    materials['mox'] = mox_properties()
    materials['reflec'] = reflector_properties()
    output_xs(outdir, temp, materials)
