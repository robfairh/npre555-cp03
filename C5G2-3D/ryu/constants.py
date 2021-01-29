import numpy as np
import os
from os import path
import shutil


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


def homogenizes_uo2():
    return 


def homogenizes_mox():
    return 


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

    outdir = 'xs2g-homo'
    if os.path.exists(outdir):
        shutil.rmtree(outdir)
    os.mkdir(outdir)

    materials = {}
    materials['uo2'] = homogenizes_uo2()
    materials['mox'] = homogenizes_mox()
    materials['reflec'] = reflector_properties()
    output_xs(outdir, temp, materials)
