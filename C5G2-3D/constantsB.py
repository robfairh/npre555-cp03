import numpy as np
import os
from os import path
import shutil

'''
Materials:
- uo2 - U - UO2 Fuel
- mox3 - P1 - 4.3% MOX Fuel (outer)
- mox2 - P2 - 7.0% MOX Fuel
- mox1 - P3 - 8.7% MOX Fuel (inner)
- gtub - X - Guide Tube
- reflec - R - Reflector
- fchamb - C - Moveable Fission Chamber

'''
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

    return mat


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

    return mat


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

    return mat


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

    return mat


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

    return mat


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

    return mat


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

    return prepare_xs(mat)


def homogenizer(XS, vi):
    HXS = {}
    HXS = {'diff': np.zeros(2),
           'absxs': np.zeros(2),
           'nsfxs': np.zeros(2),
           'chi': np.array([1., 0.]),
           'scxs': np.zeros(4)
           }

    for data in HXS.keys():
        if data != 'chi':
            value = 0
            for count, mat in enumerate(XS.keys()):
                try:
                    value += XS[mat][data] * vi[count]
                except KeyError:
                    value += 0
            HXS[data] = value

    return HXS


def homogenizes_uo2():
    # uo2, gtube, fchamb
    V = np.array([ 17*17-25, 24, 1])/(17*17)

    XS = {}
    XS['uo2'] = uo2_properties()
    XS['gtube'] = guide_properties()
    XS['fcham'] = fission_properties()

    mat = homogenizer(XS, V)
    print(mat)
    return prepare_xs(mat)


def homogenizes_mox():
    # mox1, mox2, mox3, gtube, fchamb
    V = np.array([ 100, 123, 66, 24, 1])/(17*17)

    XS = {}
    XS['mox1'] = mox1_properties()
    XS['mox2'] = mox2_properties()
    XS['mox3'] = mox3_properties()  
    XS['gtube'] = guide_properties()
    XS['fcham'] = fission_properties()
    
    mat = homogenizer(XS, V)
    print(mat)
    return prepare_xs(mat)


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
