import os
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
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


if __name__ == "__main__":
    add_legend()
