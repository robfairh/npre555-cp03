import numpy as np
import serpentTools as sT
import argparse
import os
import shutil


def process_xs1g_diff(constants):
    '''
    This function
    '''

    G = len(constants['FLX'])

    flux = sum(constants['FLX'])
    totxs = sum(constants['TOT'] * constants['FLX'])/flux
    s0xs = sum(constants['SP0'].reshape(3, 3).T @ constants['FLX'])/flux
    remxs = totxs - s0xs

    constants2 = {}
    constants2['BETA_EFF'] = np.zeros(8)
    constants2['CHID'] = 0
    constants2['CHIP'] = 0
    constants2['CHIT'] = 1
    constants2['DIFFCOEF'] = sum(constants['DIFFCOEF'] * constants['FLX'])/flux
    constants2['FISS'] = sum(constants['FISS'] * constants['FLX'])/flux
    constants2['INVV'] = 0
    constants2['KAPPA'] = 200
    constants2['LAMBDA'] = np.zeros(8)
    constants2['NSF'] = sum(constants['NSF'] * constants['FLX'])/flux
    constants2['REMXS'] = remxs
    constants2['SP0'] = s0xs

    return constants2


def process_xs1g_sp3(constants):
    '''
    This function
    '''

    G = len(constants['FLX'])

    flux = sum(constants['FLX'])
    totxs = sum(constants['TOT'] * constants['FLX'])/flux
    s0xs = sum(constants['SP0'].reshape(3, 3).T @ constants['FLX'])/flux
    s1xs = sum(constants['SP1'].reshape(3, 3).T @ constants['FLX'])/flux
    s2xs = sum(constants['SP2'].reshape(3, 3).T @ constants['FLX'])/flux
    s3xs = sum(constants['SP3'].reshape(3, 3).T @ constants['FLX'])/flux
    rem0xs = totxs - s0xs
    rem1xs = totxs - s1xs
    rem2xs = totxs - s2xs
    rem3xs = totxs - s3xs

    constants2 = {}
    constants2['BETA_EFF'] = np.zeros(8)
    constants2['CHID'] = 0
    constants2['CHIP'] = 0
    constants2['CHIT'] = 1
    constants2['COUPLEXSA'] = 2*rem0xs
    constants2['COUPLEXSB'] = 2./5*rem0xs
    constants2['DIFFCOEFA'] = 1./3/rem1xs
    constants2['DIFFCOEFB'] = 9./35/rem3xs
    constants2['FISS'] = sum(constants['FISS'] * constants['FLX'])/flux
    constants2['INVV'] = 0
    constants2['KAPPA'] = 200
    constants2['LAMBDA'] = np.zeros(8)
    constants2['NSF'] = sum(constants['NSF'] * constants['FLX'])/flux
    constants2['REMXSA'] = rem0xs
    constants2['REMXSB'] = rem2xs + 4./5*rem0xs
    constants2['SP0'] = s0xs

    return constants2


def output_xs(outdir, temp, materials):
    '''
    This function outputs the dictionary with the material cross-sections
    into the Cerberus and Moltres readable format.

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


if __name__ == '__main__':
    '''
    Cross-sections from 'fullcore3G-LBP.coe' - 9 176 (fuel).
    '''

    # get data from .coe
    coeList = sT.read('fullcore3G-LBP.coe')

    # user defined parameters
    mat = 'fuel'
    item = 'fuel0'
    uni = '9'

    getdata = ['Flx', 'Tot', 'Sp0', 'Sp2', 'Fiss', 'Nsf', 'Kappa', 'Sp1', 'Sp3',
               'Invv', 'Chit', 'Chip', 'Chid', 'Diffcoef', 'Abs']
    goodMap = dict([(thing, 'inf' + thing) for thing in getdata])

    constants = {}
    for data in getdata:
        constants[data.upper()] = coeList.branches[item].universes[
            uni, 0, 0, None].infExp[goodMap[data]]

    # create 1G cross-section files for Cerberus
    materials = {}
    materials['fuel'] = process_xs1g_sp3(constants)

    outdir = 'xs1g-sp3'
    if os.path.exists(outdir):
        shutil.rmtree(outdir)
    os.mkdir(outdir)

    temp = 300
    output_xs(outdir, temp, materials)

    # create 1G cross-section files for Moltres
    materials = {}
    materials['fuel'] = process_xs1g_diff(constants)

    outdir = 'xs1g-diff'
    if os.path.exists(outdir):
        shutil.rmtree(outdir)
    os.mkdir(outdir)

    temp = 300
    output_xs(outdir, temp, materials)

    # create 3G cross-section files for Cerberus
    os.system('bash create-xs-sp3.sh')

    # create 3G cross-section files for moltres
    os.system('bash create-xs-diff.sh')
