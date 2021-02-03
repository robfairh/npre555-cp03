# This script is based on moltres/python/extractSerpent2GCs.py
import os
import numpy as np
import argparse
import subprocess
import serpentTools as sT


def makePropertiesDir(
        outdir,
        filebase,
        mapFile,
        unimapFile,
        serp1=False,
        fromMain=False):
    """ Takes in a mapping from branch names to material temperatures,
    then makes a properties directory.
    Serp1 means that the group transfer matrix is transposed."""

    # the constants moltres looks for:
    goodStuff = ['Tot', 'Sp0', 'Sp2', 'Fiss', 'Nsf', 'Kappa', 'Sp1', 'Sp3',
                 'Invv', 'Chit', 'Chip', 'Chid', 'BETA_EFF', 'lambda']
    goodMap = dict([(thing, 'inf' + thing) for thing in goodStuff])
    goodMap['BETA_EFF'] = 'betaEff'
    goodMap['lambda'] = 'lambda'

    # map material names to universe names from serpent
    with open(unimapFile) as fh:
        uniMap = []
        for line in fh:
            uniMap.append(tuple(line.split()))
    # this now maps material names to serpent universes
    uniMap = dict(uniMap)

    # list of material names
    inmats = list(uniMap.keys())

    print("Making properties for materials:")
    print(inmats)
    coeList = dict([(mat, sT.read(mat + '.coe')) for mat in inmats])

    # primary branch to temp mapping
    branch2TempMapping = open(mapFile)

    # Check if calculation uses 6 neutron precursor groups.
    # This prevents writing of excess zeros. Check if any
    # entries in the 7th and 8th group precursor positions
    # are nonzero, if so, use 8 groups.
    use8Groups = False
    for line in branch2TempMapping:
        item, temp = tuple(line.split())
        for mat in inmats:
            if mat in item:
                currentMat = mat
                break

        strData = coeList[currentMat].branches[item].universes[
            uniMap[currentMat], 0, 0, None].gc[goodMap['BETA_EFF']]
        strData = strData[1:9]
        if np.any(strData[-2:] != 0.0):
            use8Groups = True

    # Now loop through a second time
    branch2TempMapping.close()
    branch2TempMapping = open(mapFile)

    for line in branch2TempMapping:

        item, temp = tuple(line.split())
        for mat in inmats:
            if mat in item:
                currentMat = mat
                break
        else:
            print('Considered materials: {}'.format(inmats))
            raise Exception(
                'Couldnt find a material corresponding to branch {}'.format(
                    item))

        try:
            totxsdata = coeList[currentMat].branches[item].universes[
                uniMap[currentMat], 0, 0, None].infExp[goodMap['Tot']]
            sp0xsdata = coeList[currentMat].branches[item].universes[
                uniMap[currentMat], 0, 0, None].infExp[goodMap['Sp0']]
            sp1xsdata = coeList[currentMat].branches[item].universes[
                uniMap[currentMat], 0, 0, None].infExp[goodMap['Sp1']]
            sp2xsdata = coeList[currentMat].branches[item].universes[
                uniMap[currentMat], 0, 0, None].infExp[goodMap['Sp2']]
            sp3xsdata = coeList[currentMat].branches[item].universes[
                uniMap[currentMat], 0, 0, None].infExp[goodMap['Sp3']]

            G = len(totxsdata)
            remxs0g = totxsdata - sp0xsdata.reshape((G, G)).diagonal()
            remxs1g = totxsdata - sp1xsdata.reshape((G, G)).diagonal()
            remxs2g = totxsdata - sp2xsdata.reshape((G, G)).diagonal()
            remxs3g = totxsdata - sp3xsdata.reshape((G, G)).diagonal()

            with open(outdir + '/' + filebase + '_' + currentMat +
                      '_DIFFCOEFA.txt', 'a') as fh:

                strData = 1./3./remxs1g
                strData = ' '.join(
                    [str(dat) for dat in strData]) if isinstance(
                    strData, np.ndarray) else strData
                fh.write(str(temp) + ' ' + strData)
                fh.write('\n')

            with open(outdir + '/' + filebase + '_' + currentMat +
                      '_DIFFCOEFB.txt', 'a') as fh:

                strData = 9./35./remxs3g
                strData = ' '.join(
                    [str(dat) for dat in strData]) if isinstance(
                    strData, np.ndarray) else strData
                fh.write(str(temp) + ' ' + strData)
                fh.write('\n')

            with open(outdir + '/' + filebase + '_' + currentMat +
                      '_REMXSA.txt', 'a') as fh:

                strData = remxs0g
                strData = ' '.join(
                    [str(dat) for dat in strData]) if isinstance(
                    strData, np.ndarray) else strData
                fh.write(str(temp) + ' ' + strData)
                fh.write('\n')

            with open(outdir + '/' + filebase + '_' + currentMat +
                      '_REMXSB.txt', 'a') as fh:

                strData = remxs2g + 4./5*remxs0g
                strData = ' '.join(
                    [str(dat) for dat in strData]) if isinstance(
                    strData, np.ndarray) else strData
                fh.write(str(temp) + ' ' + strData)
                fh.write('\n')

            with open(outdir + '/' + filebase + '_' + currentMat +
                      '_COUPLEXSA.txt', 'a') as fh:

                strData = 2*remxs0g
                strData = ' '.join(
                    [str(dat) for dat in strData]) if isinstance(
                    strData, np.ndarray) else strData
                fh.write(str(temp) + ' ' + strData)
                fh.write('\n')

            with open(outdir + '/' + filebase + '_' + currentMat +
                      '_COUPLEXSB.txt', 'a') as fh:

                strData = 2./5*remxs0g
                strData = ' '.join(
                    [str(dat) for dat in strData]) if isinstance(
                    strData, np.ndarray) else strData
                fh.write(str(temp) + ' ' + strData)
                fh.write('\n')

            for coefficient in ['Chit', 'Chip', 'Chid', 'Fiss', 'Nsf', 'Sp0',
                                'Kappa', 'Invv', 'BETA_EFF', 'lambda']:
                with open(outdir + '/' + filebase + '_' + currentMat +
                          '_' + coefficient.upper() + '.txt', 'a') as fh:

                    if coefficient == 'lambda' or coefficient == 'BETA_EFF':
                        strData = coeList[currentMat].branches[
                            item].universes[
                                uniMap[currentMat], 0, 0, None].gc[
                                    goodMap[coefficient]]
                        # some additional formatting is needed here
                        strData = strData[1:9]

                        # Cut off group 7 and 8 precursor params in 6
                        # group calcs
                        if not use8Groups:
                            strData = strData[0:6]
                    else:
                        strData = coeList[currentMat].branches[
                            item].universes[
                                uniMap[currentMat], 0, 0, None].infExp[
                                    goodMap[coefficient]]

                    strData = ' '.join(
                        [str(dat) for dat in strData]) if isinstance(
                        strData, np.ndarray) else strData
                    fh.write(str(temp) + ' ' + strData)
                    fh.write('\n')

        except KeyError:
            raise Exception('Check your mapping and secondary branch files.')


if __name__ == '__main__':

    # make it act like a nice little terminal program
    parser = argparse.ArgumentParser(
        description='Extracts Serpent 2 group constants, \
            and puts them in a directory suitable for moltres.')
    parser.add_argument('outDir', metavar='o', type=str, nargs=1,
                        help='name of directory to write properties to.')
    parser.add_argument('fileBase', metavar='f', type=str,
                        nargs=1, help='File base name to give moltres')
    parser.add_argument(
        'mapFile',
        metavar='b',
        type=str,
        nargs=1,
        help='File that maps branches to temperatures')
    parser.add_argument(
        'universeMap',
        metavar='u',
        type=str,
        nargs=1,
        help='File that maps material names to serpent universe')
    parser.add_argument(
        '--serp1',
        dest='serp1',
        action='store_true',
        help='use this flag for serpent 1 group transfer matrices')
    parser.set_defaults(serp1=False)

    args = parser.parse_args()

    # these are unpacked, so it fails if they werent passed to the script
    outdir = args.outDir[0]
    fileBase = args.fileBase[0]
    mapFile = args.mapFile[0]
    unimapFile = args.universeMap[0]

    makePropertiesDir(outdir, fileBase, mapFile, unimapFile, serp1=args.serp1,
                      fromMain=True)

    print("Successfully made property files in directory {}.".format(outdir))
