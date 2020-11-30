import numpy as np
import pandas as pd
import matplotlib.pyplot as plt


def plotcsv_frommoose_temp(file, save, dire='x'):
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

    plt.figure()

    # flux = np.array(file['flux'].tolist())
    # plt.plot(d, flux)

    # flux0 = np.array(file['flux0'].tolist())
    # flux2 = np.array(file['flux2'].tolist())
    # flux = flux0 - 2*flux2

    # plt.plot(d, flux)
    # plt.plot(d, flux0, label='flux0')
    # plt.plot(d, flux2, label='flux2')
    # plt.legend(loc='upper right')

    flux1 = np.array(file['flux1'].tolist())
    flux2 = np.array(file['flux2'].tolist())
    flux3 = np.array(file['flux3'].tolist())
    plt.plot(d, flux1, label='g=1')
    plt.plot(d, flux2, label='g=2')
    plt.plot(d, flux3, label='g=3')
    plt.legend(loc='upper right')

    plt.xlabel(dire + ' [cm]')
    plt.ylabel(r'$\phi \left[\frac{n}{cm^2s}\right]$')
    plt.savefig(save, dpi=300, bbox_inches="tight")
    plt.close()


# save = 'output-1g-fixed'
# file = 'input-fixed_line_0001.csv'
# save = 'output-1g-crit'
# file = 'input-1g-crit_line_0001.csv'
# save = 'output-3g-fixed'
# file = 'input-3g-fixed_line_0001.csv'
save = 'output-3g-crit'
file = 'input-3g-crit_line_0001.csv'
plotcsv_frommoose_temp(file, save, dire='x')
