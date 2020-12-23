import numpy as np
import os
from os import path
import shutil


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

    mu1 = np.array([1.0, 1.0])
    # mu1 = np.array([1.013854, 0.996026])
    mu1b = np.concatenate((mu1, mu1))
    mu2 = np.array([1.0, 1.0])
    # mu2 = np.array([1.003107, 0.999433])
    mu2b = np.concatenate((mu2, mu2))

    materials = {
        'mox': {
             'totxs': np.array([0.553087, 1.068911]) * mu1,
             'nfxs': np.array([0.006857, 0.340391]) * mu1,
             'scxs': np.array([0.523430, 0.016089, 0, 0.839806]) * mu1b
            },

        'uo2': {
             'totxs': np.array([0.571360, 1.111391]) * mu2,
             'nfxs': np.array([0.004575, 0.113135]) * mu2,
             'scxs': np.array([0.541700, 0.020475, 0, 1.018984]) * mu2b
            },

        'reflec': {
                 'totxs': np.array([0.611, 2.340]),
                 'nfxs': np.array([0.00, 0.00]),
                 'scxs': np.array([0.560, 0.050, 0, 2.30])
               }
    }

    return materials


def create_xs(outdir, temp, materials):
    '''
    This function outputs the dictionary with the material cross-sections
    into the SP3 App readable format.

    '''

    for currentMat in materials.keys():

        remxs = materials[currentMat]['totxs'] - \
            materials[currentMat]['scxs'].reshape((2, 2)).diagonal()

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

    # # produces cross-sections for the heterogeneous case
    # outdir = 'xs2g'
    # if os.path.exists(outdir):
    #     shutil.rmtree(outdir)
    # os.mkdir(outdir)
    # materials = materials_het()
    # create_xs(outdir, temp, materials)
    # materials = materials_het_diag()
    # create_xs_diag(outdir, temp, materials)

    # produces cross-sections for the homogeneous case
    outdir = 'xs2g-homoB'
    if os.path.exists(outdir):
        shutil.rmtree(outdir)
    os.mkdir(outdir)
    materials = materials_hom()
    create_xs(outdir, temp, materials)
