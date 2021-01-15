import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from matplotlib.patches import RegularPolygon
from matplotlib.collections import PatchCollection
from matplotlib.pyplot import gca


def bench_power():

    uo2_A = np.array(
    [[1341, 1344, 1349, 1354, 1358, 1358, 1348, 1338, 1326, 1309, 1291, 1270, 1237, 1192, 1131, 1042, 899],
    [1344, 1349, 1359, 1370, 1384, 1394, 1371, 1360, 1360, 1331, 1313, 1304, 1260, 1206, 1139, 1045, 899],
    [1349, 1359, 1383, 1413, 1426,    0, 1399, 1385,    0, 1357, 1339,    0, 1298, 1243, 1160, 1053, 901],
    [1354, 1370, 1413,    0, 1437, 1420, 1388, 1373, 1374, 1344, 1328, 1327, 1307,    0, 1185, 1061, 903],
    [1358, 1384, 1426, 1437, 1422, 1416, 1385, 1371, 1371, 1342, 1325, 1322, 1292, 1262, 1194, 1072, 906],
    [1358, 1394,    0, 1420, 1416,    0, 1392, 1379,    0, 1350, 1332,    0, 1287, 1246,    0, 1079, 904],
    [1348, 1371, 1399, 1388, 1385, 1392, 1367, 1354, 1355, 1326, 1307, 1300, 1258, 1217, 1169, 1060, 897],
    [1338, 1359, 1385, 1373, 1371, 1379, 1354, 1343, 1344, 1314, 1295, 1287, 1244, 1204, 1156, 1049, 888],
    [1326, 1360,    0, 1374, 1371,    0, 1355, 1343,    0, 1315, 1295,    0, 1244, 1203,    0, 1049, 880],
    [1309, 1331, 1356, 1344, 1342, 1349, 1326, 1314, 1315, 1285, 1266, 1258, 1216, 1176, 1130, 1025, 868],
    [1291, 1313, 1339, 1328, 1325, 1332, 1307, 1295, 1295, 1266, 1248, 1241, 1200, 1161, 1115, 1010, 855],
    [1270, 1304,    0, 1327, 1322,    0, 1300, 1287,    0, 1258, 1241,    0, 1197, 1159,    0, 1004, 841],
    [1237, 1260, 1298, 1307, 1292, 1287, 1258, 1244, 1244, 1216, 1200, 1197, 1169, 1141, 1081,  970, 821],
    [1192, 1206, 1243,    0, 1262, 1246, 1217, 1204, 1203, 1176, 1161, 1159, 1141,    0, 1037,  931, 795],
    [1131, 1139, 1160, 1185, 1194,    0, 1169, 1156,    0, 1130, 1115,    0, 1081, 1037,  970,  886, 765],
    [1042, 1045, 1053, 1061, 1072, 1079, 1060, 1049, 1049, 1025, 1010, 1004,  970,  931,  886, 825, 729],
    [ 899,  899,  901,  903,  906,  904,  897,  888,  880,  868,  855,  841,  821,  795,  765, 729, 675]])

    mox = np.array(
    [[1518, 1238, 1106, 1038,  996,  957,  911,  865,  822, 773, 725, 679, 629, 587, 570, 619, 830],
    [1507, 1434, 1271, 1202, 1170, 1153, 1064, 1008,  984, 902, 845, 817, 741, 679, 656, 722, 822],
    [1502, 1422, 1284, 1256, 1214,    0, 1065, 1003,    0, 899, 842,   0, 767, 709, 663, 714, 816],
    [1504, 1432, 1335,    0, 1195, 1252, 1122, 1055, 1035, 943, 887, 881, 748,   0, 689, 718, 814],
    [1509, 1458, 1354, 1250, 1282, 1205, 1084, 1020, 1004, 912, 857, 847, 803, 699, 694, 728, 813],
    [1508, 1490,    0, 1367, 1251,    0, 1107, 1043,    0, 934, 873,   0, 787, 760,   0, 742, 809],
    [1494, 1435, 1285, 1272, 1170, 1148, 1048,  991,  977, 886, 829, 810, 734, 707, 653, 712, 799],
    [1479, 1418, 1266, 1250, 1150, 1130, 1034,  978,  964, 875, 818, 797, 721, 693, 641, 702, 789],
    [1466, 1440,    0, 1280, 1179,    0, 1063, 1004,    0, 900, 838,   0, 740, 708,   0, 711, 780],
    [1444, 1385, 1236, 1220, 1122, 1103, 1008,  954,  940, 852, 796, 776, 701, 674, 624, 682, 766],
    [1423, 1366, 1222, 1209, 1111, 1089,  994,  940,  925, 839, 784, 765, 693, 667, 615, 671, 752],
    [1402, 1385,    0, 1268, 1159,    0, 1025,  964,    0, 862, 805,   0, 723, 697,   0, 679, 739],
    [1368, 1324, 1230, 1134, 1162, 1091,  981,  922,  906, 822, 771, 761, 719, 625, 620, 649, 721],
    [1329, 1272, 1190,    0, 1065, 1114,  997,  937,  917, 834, 783, 776, 657,   0, 603, 625, 703],
    [1292, 1243, 1136, 1117, 1081,    0,  946,  889,    0, 794, 742,   0, 673, 621, 578, 616, 693],
    [1270, 1267, 1159, 1111, 1086, 1070,  988,  935,  909, 832, 777, 748, 678, 620, 594, 640, 701],
    [1290, 1179, 1121, 1082, 1048, 1009,  961,  911,  863, 810, 757, 707, 654, 608, 583, 610, 755]])

    uo2_B = np.array(
    [[628, 635, 626, 612, 594, 572, 546, 518, 490, 460, 430, 401, 371, 344, 327, 331, 377],
    [635, 677, 685, 678, 665, 648, 612, 580, 554, 515, 481, 453, 416, 384, 362, 361, 399],
    [626, 685, 708, 715, 703,   0, 642, 607,   0, 539, 504,   0, 440, 406, 377, 369, 401],
    [612, 678, 715,   0, 704, 673, 632, 599, 571, 531, 497, 470, 440,   0, 382, 367, 393],
    [594, 665, 703, 704, 680, 655, 617, 583, 556, 517, 483, 457, 424, 399, 374, 360, 381],
    [572, 648,   0, 673, 655,   0, 600, 568,   0, 503, 469,   0, 408, 380,   0, 348, 365],
    [546, 612, 642, 632, 617, 600, 566, 536, 511, 475, 443, 417, 383, 356, 339, 328, 346],
    [518, 580, 607, 599, 583, 568, 536, 508, 484, 449, 419, 394, 361, 335, 319, 309, 326],
    [490, 554,   0, 571, 556,   0, 511, 484,   0, 428, 399,   0, 344, 319,   0, 293, 306],
    [460, 515, 539, 531, 517, 503, 475, 449, 428, 397, 370, 347, 318, 295, 281, 271, 286],
    [430, 481, 504, 497, 483, 469, 443, 419, 399, 370, 344, 323, 297, 275, 261, 252, 265],
    [401, 453,   0, 470, 457,   0, 417, 394,   0, 347, 323,   0, 279, 259,   0, 236, 245],
    [371, 416, 440, 440, 424, 408, 383, 361, 344, 318, 297, 279, 258, 241, 226, 215, 225],
    [344, 384, 406,   0, 399, 380, 356, 335, 319, 295, 275, 259, 241,   0, 207, 196, 206],
    [327, 362, 377, 382, 374,   0, 339, 319,   0, 281, 261,   0, 226, 207, 190, 181, 189],
    [331, 361, 369, 367, 359, 348, 328, 309, 293, 271, 252, 236, 215, 196, 181, 173, 179],
    [377, 399, 401, 393, 381, 365, 346, 326, 306, 286, 265, 245, 225, 206, 189, 179, 178]])

    uo2a = np.sum(uo2_A) * 1e-6
    uo2b = np.sum(uo2_B) * 1e-6
    mox = np.sum(mox) * 1e-6
    tot = uo2a + uo2b + 2*mox

    return uo2a, uo2b, mox, tot


def power_distrib(file):
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

    '''

    uo2a_r, uo2b_r, mox_r, tot_r = bench_power()

    file = pd.read_csv(file)
    tot = np.array(file['total_fission_heat'].tolist()[-1])
    uo2a = np.array(file['uo2a_fission_heat'].tolist()[-1])
    uo2b = np.array(file['uo2b_fission_heat'].tolist()[-1])
    moxa = np.array(file['moxa_fission_heat'].tolist()[-1])
    moxb = np.array(file['moxb_fission_heat'].tolist()[-1])

    norm = 1/tot * tot_r

    uo2a *= norm
    uo2b *= norm
    moxa *= norm
    moxb *= norm
    mox = (moxa + moxb)/2

    print(uo2a)
    print(uo2b)
    print(mox)

    print(uo2a_r)
    print(uo2b_r)
    print(mox_r)

    uo2a_rel = (uo2a - uo2a_r) / uo2a_r * 100
    uo2b_rel = (uo2b - uo2b_r) / uo2b_r * 100
    mox_rel = (mox - mox_r) / mox_r * 100

    print('uo2a [%]: ', uo2a_rel)
    print('uo2b [%]: ', uo2b_rel)
    print('mox [%]: ', mox_rel)

    power = np.array([uo2a, mox, mox, uo2b])
    power_rel = np.array([uo2a_rel, mox_rel, mox_rel, uo2b_rel])
    return power, power_rel


def plot_radial_power_distribution(power, rel=False):
    '''
    Plots radial power distribution.
    Parameters:
    -----------
    power: [numpy array]
        contains the values in MW of the power produced in each fuel column
        the reactor model includes only a 1/6th of the reactor (only 11
        columns).
    save: [string]
        name of the figure
    '''

    P = 21.42  # pitch
    F = P/np.sqrt(2)
    coord = []
    # 1 - 2
    coord.append(np.array([0*P+P/2, 0*P+P/2]))
    coord.append(np.array([1*P+P/2, 0*P+P/2]))
    # 3 - 4
    coord.append(np.array([0*P+P/2, 1*P+P/2]))
    coord.append(np.array([1*P+P/2, 1*P+P/2]))
    coord = np.array(coord)

    if rel is False:
        patches = []
        xmax, ymax = [-np.inf, ] * 2
        xmin, ymin = [np.inf, ] * 2
        for i in range(len(coord)):
            h = RegularPolygon(coord[i], 4, F, np.pi/4)
            # h = RegularPolygon(coord[i], 4, F, 0)
            patches.append(h)
            verts = h.get_verts()
            vmins = verts.min(0)
            vmaxs = verts.max(0)
            xmax = max(xmax, vmaxs[0])
            xmin = min(xmin, vmins[0])
            ymax = max(ymax, vmaxs[1])
            ymin = min(ymin, vmins[1])

        patches = np.array(patches, dtype=object)
        pc = PatchCollection(patches)

        ax = gca()
        pc.set_array(power)
        ax.add_collection(pc)
        ax.set_xlim(xmin, xmax)
        ax.set_ylim(ymin, ymax)

        cbar = plt.colorbar(pc)
        cbar.ax.set_ylabel('Power [W]')

        for i in range(len(coord)):
            plt.text(x=coord[i][0]-F/4, y=coord[i][1]+F/5, s=np.round(power[i], 3), fontsize=20, color='w')
    else:
        for i in range(len(coord)):
            plt.text(x=coord[i][0]-F/4, y=coord[i][1]-F/5, s=np.round(power[i], 3), fontsize=20, color='w')

    plt.axis('equal')
    plt.xlabel('X [cm]')
    plt.ylabel('Y [cm]')


if __name__ == "__main__":

    power, power_rel = power_distrib('input-2g-het.csv')
    plot_radial_power_distribution(power)
    plot_radial_power_distribution(power_rel, rel=True)
    plt.savefig('distrib', dpi=300, bbox_inches="tight")
    plt.close()