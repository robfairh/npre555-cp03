import os
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import matplotlib.patches as mpatches
from matplotlib.cbook import get_sample_data
import matplotlib.ticker as ticker


def add_legend():
    '''
    Adds legend to image of the geometry.
    '''

    matrix = mpatches.Patch(color=(0.85, 0.85, 0.85), label='Moderator')
    block = mpatches.Patch(color=(1., 0., 0.), label='Fuel')

    cwd = os.getcwd()
    fname = get_sample_data('%s/mesh.png' % (cwd))
    image = plt.imread(fname)
    fig, ax = plt.subplots()
    ax.imshow(image)

    xlength = 20
    scalex = xlength/567
    ticks_x = ticker.FuncFormatter(lambda x, pos: '{0:g}'.format(x*scalex))
    ax.xaxis.set_major_formatter(ticks_x)
    xticks = np.arange(0, np.floor(xlength)+1, 5)/scalex
    ax.set_xticks(xticks)
    ax.tick_params(axis="x", labelsize=14)

    ylength = 20
    scaley = ylength/567
    ticks_y = ticker.FuncFormatter(lambda x, pos: '{0:g}'.format(x*scaley))
    ax.yaxis.set_major_formatter(ticks_y)
    yticks = np.arange(0, np.floor(ylength)+1, 5)/scaley
    ax.set_yticks(yticks)
    ax.tick_params(axis="y", labelsize=14)

    ax.set_xlabel('x [cm]', fontsize=14)
    ax.set_ylabel('y [cm]', fontsize=14)
    # plt.legend(handles=[matrix, block], loc="lower right",
    #            bbox_to_anchor=(1.0, 1.0),  fontsize=12)
    plt.savefig("mesh2", dpi=300, bbox_inches="tight")
    plt.close()


def plotcsv_frommoose_1G(file, save, diff=True, fix=True, dire='x'):
    '''
    Running MOOSE app produces a csv file.
    This function plots the values in it.
    The output is a figure.

    Parameters:
    -----------
    file: [string]
        name of the .csv file
    save: [string]
        name of the figure
    diff: [bool]
        True if plotting the diffusion solution
    fix: [bool]
        True if plotting the solution to a fixed source problem
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

    if diff is True:
        flux = np.array(file['flux'].tolist())
        legend = 'Diff'

    else:
        flux0 = np.array(file['flux0'].tolist())
        flux2 = np.array(file['flux2'].tolist())
        flux = flux0 - 2*flux2
        legend = 'SP3'

    if fix is False:
        flux /= max(flux)

    plt.plot(d, flux, label=legend)
    plt.legend(loc='upper right')
    plt.xlabel(dire + ' [cm]')
    plt.ylabel(r'$\phi \left[\frac{n}{cm^2s}\right]$')


def plotcsv_frommoose_multi(file, save, diff=True, fix=True, G=3, dire='x'):
    '''
    Running MOOSE app produces a csv file.
    This function plots the values in it.
    The output is a figure.

    Parameters:
    -----------
    file: [string]
        name of the .csv file
    save: [string]
        name of the figure
    diff: [bool]
        True if plotting the diffusion solution
    fix: [bool]
        True if plotting the solution to a fixed source problem
    G: [int]
        Number of energy groups
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
        if diff is True:
            flux = np.array(file['flux'+str(g+1)].tolist())
            legend = 'Diff'
        else:
            flux0 = np.array(file['flux0_'+str(g+1)].tolist())
            flux2 = np.array(file['flux2_'+str(g+1)].tolist())
            flux = flux0 - 2*flux2
            legend = 'SP3'

        if fix is False:
            if g == 0:
                M = max(flux)
            flux /= M
        plt.plot(d, flux, label=legend+', g='+str(g+1))

    plt.legend(loc='upper right')
    plt.xlabel(dire + ' [cm]')
    plt.ylabel(r'$\phi \left[\frac{n}{cm^2s}\right]$')


if __name__ == "__main__":

    add_legend()

    # save = 'output'
    # plt.figure()
    # file = 'input_line_0001.csv' 
    # plotcsv_frommoose_1G(file, save, diff=False, fix=False, dire='x')
    # plt.savefig(save, dpi=300, bbox_inches="tight")
