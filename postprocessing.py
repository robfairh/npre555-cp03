import numpy as np
import pandas as pd
import matplotlib.pyplot as plt


def plotcsv_frommoose_temp(file, legend, dire='x'):
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

    flux = file['flux'].tolist()

    # plt.figure()
    plt.plot(d, flux, label=legend)
    plt.xlabel(dire + ' [cm]')
    plt.ylabel(r'$\phi \left[\frac{n}{cm^2s}\right]$')
    # plt.savefig(save, dpi=300, bbox_inches="tight")
    # plt.close()


save = 'output'

file = 'diffusion/input-1g-fixed_line_0001.csv'
legend = 'diffusion'
plotcsv_frommoose_temp(file, legend, dire='x')

file = 'p1/input_line_0001.csv'
legend = 'p1'
plotcsv_frommoose_temp(file, legend, dire='x')

file = 'p3/input_line_0001.csv'
legend = 'p3'
file = pd.read_csv(file)
flux0 = np.array(file['flux0'].tolist())
flux2 = np.array(file['flux2'].tolist())
flux = flux0 - 2*flux2
x = np.array(file['x'].tolist())
plt.plot(x, flux, label=legend)

plt.legend(loc='upper right')
plt.savefig(save, dpi=300, bbox_inches="tight")
