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
        * main keys:
            - fuel
            - moderator

        * secondary keys:
            - totxs
            - scxs
            - nsf    '''

    materials = {
        'fuel': {
                'totxs': np.array([1.5]),
                'scxs': np.array([1.35]),
                'nfxs': np.array([0.24]),
                },
        'moderator': {
                'totxs': np.array([1.0]),
                'scxs': np.array([0.93]),
                'nfxs': np.array([0.0]),
                     },
    }

    return materials


def create_xs(outdir, temp, materials):
    '''
    This function outputs the dictionary with the material cross-sections
    into the SP3 App readable format.

    '''

    for currentMat in materials.keys():

        G = len(materials[currentMat]['totxs'])
        if G > 1:
            remxs = materials[currentMat]['totxs'] - \
                materials[currentMat]['scxs'].reshape((G, G)).diagonal()
        else:
            remxs = materials[currentMat]['totxs'] - \
                materials[currentMat]['scxs']

        with open(outdir + '/' + currentMat +
                  '_DIFFCOEFA.txt', 'a') as fh:

            strData = 1./3./materials[currentMat]['totxs']
            strData = ' '.join(
                [str(dat) for dat in strData]) if isinstance(
                strData, np.ndarray) else strData
            fh.write(str(temp) + ' ' + strData)
            fh.write('\n')

        with open(outdir + '/' + currentMat +
                  '_DIFFCOEFB.txt', 'a') as fh:

            strData = 9./35./materials[currentMat]['totxs']
            strData = ' '.join(
                [str(dat) for dat in strData]) if isinstance(
                strData, np.ndarray) else strData
            fh.write(str(temp) + ' ' + strData)
            fh.write('\n')

        with open(outdir + '/' + currentMat +
                  '_REMXSA.txt', 'a') as fh:

            strData = remxs
            strData = ' '.join(
                [str(dat) for dat in strData]) if isinstance(
                strData, np.ndarray) else strData
            fh.write(str(temp) + ' ' + strData)
            fh.write('\n')

        with open(outdir + '/' + currentMat +
                  '_REMXSB.txt', 'a') as fh:

            strData = materials[currentMat]['totxs'] + 4./5 * remxs
            strData = ' '.join(
                [str(dat) for dat in strData]) if isinstance(
                strData, np.ndarray) else strData
            fh.write(str(temp) + ' ' + strData)
            fh.write('\n')

        with open(outdir + '/' + currentMat +
                  '_COUPLEXSA.txt', 'a') as fh:

            strData = 2 * remxs
            strData = ' '.join(
                [str(dat) for dat in strData]) if isinstance(
                strData, np.ndarray) else strData
            fh.write(str(temp) + ' ' + strData)
            fh.write('\n')

        with open(outdir + '/' + currentMat +
                  '_COUPLEXSB.txt', 'a') as fh:

            strData = 2./5 * remxs
            strData = ' '.join(
                [str(dat) for dat in strData]) if isinstance(
                strData, np.ndarray) else strData
            fh.write(str(temp) + ' ' + strData)
            fh.write('\n')

        with open(outdir + '/' + currentMat +
                  '_NSF.txt', 'a') as fh:

            strData = materials[currentMat]['nfxs']
            strData = ' '.join(
                [str(dat) for dat in strData]) if isinstance(
                strData, np.ndarray) else strData
            fh.write(str(temp) + ' ' + strData)
            fh.write('\n')

        with open(outdir + '/' + currentMat +
                  '_SP0.txt', 'a') as fh:

            strData = materials[currentMat]['scxs']
            strData = ' '.join(
                [str(dat) for dat in strData]) if isinstance(
                strData, np.ndarray) else strData
            fh.write(str(temp) + ' ' + strData)
            fh.write('\n')

        for coeff in ['CHIT', 'CHIP', 'CHID', 'FISS', 'KAPPA', 'INVV']:
            with open(outdir + '/' + currentMat +
                      '_' + coeff + '.txt', 'a') as fh:

                strData = np.array([1, 0])
                strData = ' '.join(
                    [str(dat) for dat in strData]) if isinstance(
                    strData, np.ndarray) else strData
                fh.write(str(temp) + ' ' + strData)
                fh.write('\n')

        for coefficient in ['BETA_EFF', 'lambda']:
            with open(outdir + '/' + currentMat +
                      '_' + coefficient.upper() + '.txt', 'a') as fh:

                strData = np.array([0, 0, 0, 0, 0, 0, 0, 0])
                strData = ' '.join(
                    [str(dat) for dat in strData]) if isinstance(
                    strData, np.ndarray) else strData
                fh.write(str(temp) + ' ' + strData)
                fh.write('\n')


def create_xs_diag(outdir, temp, materials):
    '''
    This function outputs the dictionary with the material cross-sections
    into the SP3 App readable format.

    '''

    for currentMat in materials.keys():

        remxs = materials[currentMat]['totxs'] - \
            materials[currentMat]['scxs'].reshape((2, 2)).diagonal()

        with open(outdir + '/' + currentMat +
                  '_DIFFCOEFA.txt', 'a') as fh:

            strData = 1./3./materials[currentMat]['trxs']
            strData = ' '.join(
                [str(dat) for dat in strData]) if isinstance(
                strData, np.ndarray) else strData
            fh.write(str(temp) + ' ' + strData)
            fh.write('\n')

        with open(outdir + '/' + currentMat +
                  '_DIFFCOEFB.txt', 'a') as fh:

            strData = 9./35./materials[currentMat]['totxs']
            strData = ' '.join(
                [str(dat) for dat in strData]) if isinstance(
                strData, np.ndarray) else strData
            fh.write(str(temp) + ' ' + strData)
            fh.write('\n')

        with open(outdir + '/' + currentMat +
                  '_REMXSA.txt', 'a') as fh:

            strData = remxs
            strData = ' '.join(
                [str(dat) for dat in strData]) if isinstance(
                strData, np.ndarray) else strData
            fh.write(str(temp) + ' ' + strData)
            fh.write('\n')

        with open(outdir + '/' + currentMat +
                  '_REMXSB.txt', 'a') as fh:

            strData = materials[currentMat]['totxs'] + 4./5 * remxs
            strData = ' '.join(
                [str(dat) for dat in strData]) if isinstance(
                strData, np.ndarray) else strData
            fh.write(str(temp) + ' ' + strData)
            fh.write('\n')

        with open(outdir + '/' + currentMat +
                  '_COUPLEXSA.txt', 'a') as fh:

            strData = 2 * remxs
            strData = ' '.join(
                [str(dat) for dat in strData]) if isinstance(
                strData, np.ndarray) else strData
            fh.write(str(temp) + ' ' + strData)
            fh.write('\n')

        with open(outdir + '/' + currentMat +
                  '_COUPLEXSB.txt', 'a') as fh:

            strData = 2./5 * remxs
            strData = ' '.join(
                [str(dat) for dat in strData]) if isinstance(
                strData, np.ndarray) else strData
            fh.write(str(temp) + ' ' + strData)
            fh.write('\n')

        with open(outdir + '/' + currentMat +
                  '_NSF.txt', 'a') as fh:

            strData = materials[currentMat]['nfxs']
            strData = ' '.join(
                [str(dat) for dat in strData]) if isinstance(
                strData, np.ndarray) else strData
            fh.write(str(temp) + ' ' + strData)
            fh.write('\n')

        with open(outdir + '/' + currentMat +
                  '_SP0.txt', 'a') as fh:

            strData = materials[currentMat]['scxs']
            strData = ' '.join(
                [str(dat) for dat in strData]) if isinstance(
                strData, np.ndarray) else strData
            fh.write(str(temp) + ' ' + strData)
            fh.write('\n')

        for coeff in ['CHIT', 'CHIP', 'CHID', 'FISS', 'KAPPA', 'INVV']:
            with open(outdir + '/' + currentMat +
                      '_' + coeff + '.txt', 'a') as fh:

                strData = np.array([1, 0])
                strData = ' '.join(
                    [str(dat) for dat in strData]) if isinstance(
                    strData, np.ndarray) else strData
                fh.write(str(temp) + ' ' + strData)
                fh.write('\n')

        for coefficient in ['BETA_EFF', 'lambda']:
            with open(outdir + '/' + currentMat +
                      '_' + coefficient.upper() + '.txt', 'a') as fh:

                strData = np.array([0, 0, 0, 0, 0, 0, 0, 0])
                strData = ' '.join(
                    [str(dat) for dat in strData]) if isinstance(
                    strData, np.ndarray) else strData
                fh.write(str(temp) + ' ' + strData)
                fh.write('\n')


if __name__ == "__main__":
    temp = 300

    # produces cross-sections for the heterogeneous case
    outdir = 'xs'
    if os.path.exists(outdir):
        shutil.rmtree(outdir)
    os.mkdir(outdir)
    materials = materials_het()
    create_xs(outdir, temp, materials)
