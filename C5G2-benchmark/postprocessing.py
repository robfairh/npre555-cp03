import numpy as np
import pandas as pd
import matplotlib.pyplot as plt


def plotcsv_frommoose_multi(file, save, hom=True, G=3, dire='x'):
    '''
    Moltres output is a csv file.
    This function plots those values.
    The output is a figure.

    Parameters:
    -----------
    file: [string]
        name of the .csv file
    save: [string]
        name of the figure
    dire: ['x', 'y', 'z']
        direction of the detector
    '''
    file = pd.read_csv(file)

    if dire == 'r':
        x = np.array(file['x'].tolist())
        y = np.array(file['y'].tolist())
        d = np.sqrt(x**2 + y**2)
    else:
        d = file[dire].tolist()

    for g in range(G):
        flux0 = np.array(file['flux0_'+str(g+1)].tolist())
        flux2 = np.array(file['flux2_'+str(g+1)].tolist())
        flux = flux0 - 2*flux2

        if hom is True:
            legend = 'HOM'
        else:
            legend = 'HET'

        if g == 0:
            M = max(flux)
        flux /= M
        plt.plot(d, flux, label=legend+', g='+str(g+1))

    plt.legend(loc='upper right')
    plt.xlabel(dire + ' [cm]')
    plt.ylabel(r'$\phi \left[\frac{n}{cm^2s}\right]$')


if __name__ == "__main__":

    save = 'output-2g-het'
    plt.figure()
    file = 'input-2g-het_line_0001.csv'
    plotcsv_frommoose_multi(file, save, diff=False, fix=False, G=2, dire='x')
    plt.savefig(save, dpi=300, bbox_inches="tight")

    save = 'output-2g-hom'
    plt.figure()
    file = 'input-2g-hom_line_0001.csv'
    plotcsv_frommoose_multi(file, save, diff=False, fix=False, G=2, dire='x')
    plt.savefig(save, dpi=300, bbox_inches="tight")
