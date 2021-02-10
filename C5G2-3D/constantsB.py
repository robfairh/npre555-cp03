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
    mat = {
        'diff': np.array([1.20, 0.40]),
        'absxs': np.array([0.010, 0.100]),
        'nsfxs': np.array([0.005, 0.125]),
        # from SS: S11, S22 and SR: S12, S21 
        'scxs': np.array([0.54, 0.02, 0.00, 1.00])
    }

    return mat


def mox1_properties():
    mat = {
        'diff': np.array([1.20, 0.40]),
        'absxs': np.array([0.015, 0.300]),
        'nsfxs': np.array([0.0075, 0.45]),
        # from SS: S11, S22 and SR: S12, S21 
        'scxs': np.array([0.52, 0.015, 0.00, 0.76])
    }

    return mat


def mox2_properties():
    mat = {
        'diff': np.array([1.20, 0.40]),
        'absxs': np.array([0.015, 0.250]),
        'nsfxs': np.array([0.0075, 0.375]),
        # from SS: S11, S22 and SR: S12, S21 
        'scxs': np.array(0.52, 0.015, 0.00, 0.83)
    }

    return mat


def mox3_properties():
    mat = {
        'diff': np.array([1.20, 0.40]),
        'absxs': np.array([0.015, 0.200]),
        'nsfxs': np.array([0.0075, 0.300]),
        # from SS: S11, S22 and SR: S12, S21 
        'scxs': np.array([0.52, 0.015, 0.00, 0.90])
    }

    return mat


def fission_properties():
    mat = {
        'diff': np.array([1.20, 0.40]),
        'absxs': np.array([0.001, 0.02]),
        'nsfxs': np.array([1e-7, 3e-6]),
        # from SS: S11, S22 and SR: S12, S21 
        'scxs': np.array([0.56, 0.025, 0.00, 1.20])
    }

    return mat


def guide_properties():
    mat = {
        'diff': np.array([1.20, 0.40]),
        'absxs': np.array([0.001, 0.02]),
        'nsfxs': np.array([0.0, 0.0]),
        # from SS: S11, S22 and SR: S12, S21 
        'scxs': np.array([0.56, 0.025, 0.00, 1.20])
    }

    return mat


def reflector_properties():
    mat = {
        'diff': np.array([1.20, 0.40]),
        'absxs': np.array([0.001, 0.04]),
        'nsfxs': np.array([0.0, 0.0]),
        # from SS: S11, S22 and SR: S12, S21 
        'scxs': np.array([0.56, 0.05, 0.00, 2.30])
    }

    return mat


def homogenizer(XS, vi):
    HXS = {}
    HXS = {'diff': np.zeros(2),
           'absxs': np.zeros(2),
           'nsfxs': np.zeros(2),
           'scxs': np.zeros(4)
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
    # uo2, gtube, fchamb
    V = np.array([ 17*17-25, 24, 1])/(17*17)

    XS = {}
    XS['uo2'] = uo2_properties()
    XS['gtube'] = guide_properties()
    XS['fcham'] = fission_properties()

    mat = homogenizer(XS, V)
    print(mat)
    return None


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
    return None


if __name__ == "__main__":

    homogenizes_uo2()
    homogenizes_mox()
    reflector_properties()
