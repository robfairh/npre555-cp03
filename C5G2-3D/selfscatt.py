import numpy as np
import os
from os import path
import shutil

'''
Cross-sections from Cavarec, 2014..

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
    '''
    Returns:
    --------
    mat: [dictionary]
        dictionary containing the cross-sections of the uo2 fuel pin
    '''
    mat = {
        'DIFFCOEF': np.array([1.20, 0.40]),
        'ABS': np.array([0.010, 0.100]),
        'NSF': np.array([0.005, 0.125]),
        # from SS: S11, S22 and SR: S12, S21
        'SP0': np.array([0.54, 0.02, 0.00, 1.00])
    }
    return mat


def mox1_properties():
    '''
    Returns:
    --------
    mat: [dictionary]
        dictionary containing the cross-sections of the mox1 fuel pin
    '''
    mat = {
        'DIFFCOEF': np.array([1.20, 0.40]),
        'ABS': np.array([0.015, 0.300]),
        'NSF': np.array([0.0075, 0.45]),
        # from SS: S11, S22 and SR: S12, S21
        'SP0': np.array([0.52, 0.015, 0.00, 0.76])
    }
    return mat


def mox2_properties():
    '''
    Returns:
    --------
    mat: [dictionary]
        dictionary containing the cross-sections of the mox2 fuel pin
    '''
    mat = {
        'DIFFCOEF': np.array([1.20, 0.40]),
        'ABS': np.array([0.015, 0.250]),
        'NSF': np.array([0.0075, 0.375]),
        # from SS: S11, S22 and SR: S12, S21
        'SP0': np.array([0.52, 0.015, 0.00, 0.83])
    }
    return mat


def mox3_properties():
    '''
    Returns:
    --------
    mat: [dictionary]
       - dictionary containing the cross-sections of the mox3 fuel pin
    '''
    mat = {
        'DIFFCOEF': np.array([1.20, 0.40]),
        'ABS': np.array([0.015, 0.200]),
        'NSF': np.array([0.0075, 0.300]),
        # from SS: S11, S22 and SR: S12, S21
        'SP0': np.array([0.52, 0.015, 0.00, 0.90])
    }
    return mat


def fission_properties():
    '''
    Returns:
    --------
    mat: [dictionary]
        dictionary containing the cross-sections of the fission chamber
    '''
    mat = {
        'DIFFCOEF': np.array([1.20, 0.40]),
        'ABS': np.array([0.001, 0.02]),
        'NSF': np.array([1e-7, 3e-6]),
        # from SS: S11, S22 and SR: S12, S21
        'SP0': np.array([0.56, 0.025, 0.00, 1.20])
    }
    return mat


def guide_properties():
    '''
    Returns:
    --------
    mat: [dictionary]
        dictionary containing the cross-sections of the guide tube
    '''
    mat = {
        'DIFFCOEF': np.array([1.20, 0.40]),
        'ABS': np.array([0.001, 0.02]),
        'NSF': np.array([0.0, 0.0]),
        # from SS: S11, S22 and SR: S12, S21
        'SP0': np.array([0.56, 0.025, 0.00, 1.20])
    }

    return mat


def reflector_properties():
    '''
    Returns:
    --------
    mat: [dictionary]
        dictionary containing the cross-sections of the reflector
    '''
    mat = {
        'DIFFCOEF': np.array([1.20, 0.40]),
        'ABS': np.array([0.001, 0.04]),
        'NSF': np.array([0.0, 0.0]),
        # from SS: S11, S22 and SR: S12, S21
        'SP0': np.array([0.56, 0.05, 0.00, 2.30])
    }

    return mat


def homogenizer(XS, vi):
    '''
    This function homogenizes the cross-sections of different materials.

    Parameters:
    -----------
    XS: [dictionary]
        dictionary with the material cross-sections of the different materials
        the primary keys are the names of the materials
    vi: [array]
        each element is the volume fraction of each material
    Returns:
    -------
    HXS: [dictionary]
        dictionary with the homogenized cross-sections
    '''
    HXS = {'DIFFCOEF': np.zeros(2),
           'ABS': np.zeros(2),
           'NSF': np.zeros(2),
           'SP0': np.zeros(4)
           }

    for data in HXS.keys():
        value = 0
        for count, mat in enumerate(XS.keys()):
            try:
                value += XS[mat][data] * vi[count]
            except KeyError:
                value += 0
        HXS[data] = value

    return HXS


def homogenizes_uo2():
    '''
    This function specifies the volume fractions of the materials in the
    UO2 assembly and homogenizes the cross-sections.

    Returns:
    -------
    mat: [dictionary]
        dictionary with the homogeneous cross-sections
    '''

    # uo2, gtube, fchamb
    V = np.array([17*17-25, 24, 1])/(17*17)

    XS = {}
    XS['uo2'] = uo2_properties()
    XS['gtube'] = guide_properties()
    XS['fcham'] = fission_properties()

    mat = homogenizer(XS, V)
    return mat


def homogenizes_mox():
    '''
    This function specifies the volume fractions of the materials in the
    MOX assembly and homogenizes the cross-sections.

    Returns:
    -------
    mat: [dictionary]
        dictionary with the homogeneous cross-sections
    '''

    # mox1, mox2, mox3, gtube, fchamb
    V = np.array([100, 123, 66, 24, 1])/(17*17)

    XS = {}
    XS['mox1'] = mox1_properties()
    XS['mox2'] = mox2_properties()
    XS['mox3'] = mox3_properties()
    XS['gtube'] = guide_properties()
    XS['fcham'] = fission_properties()

    mat = homogenizer(XS, V)
    return mat


if __name__ == "__main__":

    print(homogenizes_uo2()['SP0'])
    print(homogenizes_mox()['SP0'])
    print(reflector_properties()['SP0'])
