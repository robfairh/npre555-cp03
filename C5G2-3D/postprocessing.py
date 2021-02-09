import numpy as np
import os
from os import path
import shutil
import pandas as pd
import matplotlib.pyplot as plt
from matplotlib.patches import RegularPolygon
from matplotlib.collections import PatchCollection
from matplotlib.pyplot import gca
import matplotlib.patches as mpatches
from matplotlib.cbook import get_sample_data
import matplotlib.ticker as ticker


def add_legend():
    '''
    Adds legends and dimensions to images of the geometry.
    '''

    uo2 = mpatches.Patch(color=(0.85, 0.85, 0.85), label='UO2')
    mox = mpatches.Patch(color=(1., 0., 0.), label='MOX')
    reflec = mpatches.Patch(color=(0., 1., 0.), label='Reflector')

    cwd = os.getcwd()
    fname = get_sample_data('%s/geo-xy.png' % (cwd))
    image = plt.imread(fname)
    fig, ax = plt.subplots()
    ax.imshow(image)

    xlength = 3 * 21.42
    scalex = xlength/693
    ticks_x = ticker.FuncFormatter(lambda x, pos: '{0:g}'.format(x*scalex))
    ax.xaxis.set_major_formatter(ticks_x)
    xticks = np.arange(0, 3*21.42, 10)/scalex
    ax.set_xticks(xticks)
    ax.tick_params(axis="x", labelsize=16)

    ylength = 3 * 21.42
    scaley = ylength/693
    ticks_y = ticker.FuncFormatter(lambda x, pos: '{0:g}'.format(x*scaley))
    ax.yaxis.set_major_formatter(ticks_y)
    yticks = np.arange(0, 3*21.42, 10)/scaley
    ax.set_yticks(yticks)
    ax.tick_params(axis="y", labelsize=16)

    ax.set_xlabel('X [cm]', fontsize=16)
    ax.set_ylabel('Y [cm]', fontsize=16)
    plt.legend(handles=[uo2, mox, reflec], loc="upper left",
               bbox_to_anchor=(1.0, 1.0),  fontsize=20)
    plt.savefig("geo-xy2", dpi=300, bbox_inches="tight")
    plt.close()

    cwd = os.getcwd()
    fname = get_sample_data('%s/geo-xz.png' % (cwd))
    image = plt.imread(fname)
    fig, ax = plt.subplots()
    ax.imshow(image)

    xlength = 3*21.42
    scalex = xlength/598
    ticks_x = ticker.FuncFormatter(lambda x, pos: '{0:g}'.format(x*scalex))
    ax.xaxis.set_major_formatter(ticks_x)
    xticks = np.arange(0, 3*21.42, 20)/scalex
    ax.set_xticks(xticks)
    ax.tick_params(axis="x", labelsize=18)

    ylength = 80
    scaley = ylength/740
    ticks_y = ticker.FuncFormatter(lambda x, pos: '{0:g}'.format(x*scaley))
    ax.yaxis.set_major_formatter(ticks_y)
    yticks = np.arange(0, 90, 20)/scaley
    ax.set_yticks(yticks)
    ax.tick_params(axis="y", labelsize=18)

    ax.set_xlabel('X [cm]', fontsize=18)
    ax.set_ylabel('Z [cm]', fontsize=18)
    plt.legend(handles=[uo2, mox, reflec], loc="upper left",
               bbox_to_anchor=(1.0, 1.0),  fontsize=20)
    plt.savefig("geo-xz2", dpi=300, bbox_inches="tight")
    plt.close()


def power_distrib(file):
    '''
    Running MOOSE app produces a csv file.
    This function gets the values in it.

    Parameters:
    -----------
    file: [string]
        name of the .csv file
    save: [string]
        name of the figure
    '''

    uo2a_r = 1.340
    uo2b_r = 0.474
    mox_r = 1.093
    tot_r = uo2a_r + uo2b_r + 2*mox_r

    file = pd.read_csv(file)
    uo2a = np.array(file['uo2a_fission_heat'].tolist()[-1])
    uo2b = np.array(file['uo2b_fission_heat'].tolist()[-1])
    moxa = np.array(file['moxa_fission_heat'].tolist()[-1])
    moxb = np.array(file['moxb_fission_heat'].tolist()[-1])
    tot = np.array(file['total_fission_heat'].tolist()[-1])

    norm = 1/tot * tot_r

    uo2a *= norm
    uo2b *= norm
    moxa *= norm
    moxb *= norm
    mox = (moxa + moxb)/2
   
    uo2a_rel = (uo2a - uo2a_r) / uo2a_r * 100
    uo2b_rel = (uo2b - uo2b_r) / uo2b_r * 100
    mox_rel = (mox - mox_r) / mox_r * 100

    print('uo2a [%]: ', uo2a_rel)
    print('uo2b [%]: ', uo2b_rel)
    print('mox [%]: ', mox_rel)

    power = np.array([uo2a, mox, mox, uo2b])
    power_rel = np.array([uo2a_rel, mox_rel, mox_rel, uo2b_rel])
    return power, np.absolute(power_rel)


def plot_radial_power_distribution(pitch, power, rel=False):
    '''
    Plots radial power distribution.
    Parameters:
    -----------
    pitch: [float]
        pitch between elements
    power: [numpy array]
        contains the values in MW of the power produced in each fuel column
        the reactor model includes only a 1/6th of the reactor (only 11
        columns).
    save: [string]
        name of the figure
    '''

    P = pitch
    F = P/np.sqrt(2)
    coord = []

    side = int(np.sqrt(len(power)))
    for j in range(side):
        for i in range(side):
            coord.append(np.array([i*P+P/2, j*P+P/2]))
    coord = np.array(coord)

    patches = []
    xmax, ymax = [-np.inf, ] * 2
    xmin, ymin = [np.inf, ] * 2
    for i in range(len(coord)):
        h = RegularPolygon(coord[i], 4, F, np.pi/4)
        patches.append(h)
        verts = h.get_verts()
        vmins = verts.min(0)
        vmaxs = verts.max(0)
        xmax = max(xmax, vmaxs[0])
        xmin = min(xmin, vmins[0])
        ymax = max(ymax, vmaxs[1])
        ymin = min(ymin, vmins[1])

    if rel is False:
        patches = np.array(patches, dtype=object)
        pc = PatchCollection(patches)

        ax = gca()
        pc.set_array(power)
        ax.add_collection(pc)
        ax.set_xlim(xmin, xmax)
        ax.set_ylim(ymin, ymax)
        ax.tick_params(axis="x", labelsize=18)
        ax.tick_params(axis="y", labelsize=18)

        cbar = plt.colorbar(pc)
        cbar.ax.set_ylabel('Power [W]', fontsize=18)
        cbar.ax.tick_params(labelsize=18)
        for i in range(len(coord)):
            plt.text(x=coord[i][0]-F/4, y=coord[i][1]+F/5,
                     s=np.round(power[i], 3), fontsize=24, color='w',
                     fontweight=800)

    else:
        # cbar.ax.set_ylabel('Relative error [%]')
        for i in range(len(coord)):
            plt.text(x=coord[i][0]-F/4, y=coord[i][1]-F/5,
                     s=np.round(power[i], 2), fontsize=24, color='w',
                     fontweight=800)


    # plt.axis('equal')
    plt.xlabel('X [cm]', fontsize=18)
    plt.ylabel('Y [cm]', fontsize=18)


if __name__ == "__main__":

    add_legend()

    power, power_rel = power_distrib('input.csv')
    plt.figure()
    plot_radial_power_distribution(21.42, power)
    plot_radial_power_distribution(21.42, power_rel, rel=True)
    plt.savefig('C5G23D-distrib', dpi=300, bbox_inches="tight")
    plt.close()
