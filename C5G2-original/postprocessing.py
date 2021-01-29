import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from matplotlib.patches import RegularPolygon
from matplotlib.collections import PatchCollection
from matplotlib.pyplot import gca


def bench_power():
    ''' This function contains the pin-by-pin power distribution of the C5 MOX
    Benchmark. Values from Cavarec, Perron, Verwaerde, West. Benchmark
    Calculations of Power Distribution within Assemblies. 1994. p. 233.

    C5 MOX Benchmark configuration:
    _________________________
    | uo2_A |  mox  |   R   |
    |  mox  | uo2_B |   R   |
    |   R   |   R   |   R   |

    Returns:
    --------
    uo2a: [17 x 17 array of float]
        power distribution of assembly uo2_A
    uo2b: [17 x 17 array of float]
        power distribution of assembly uo2_B
    mox: [17 x 17 array of float]
        power distribution of assembly mox
    tot: [float]
        total power of the reactor
    '''

    uo2_A = np.array([[1341, 1344, 1349, 1354, 1358, 1358, 1348, 1338, 1326,
                     1309, 1291, 1270, 1237, 1192, 1131, 1042, 899],
                     [1344, 1349, 1359, 1370, 1384, 1394, 1371, 1360, 1360,
                     1331, 1313, 1304, 1260, 1206, 1139, 1045, 899],
                     [1349, 1359, 1383, 1413, 1426,    0, 1399, 1385,    0,
                     1357, 1339,    0, 1298, 1243, 1160, 1053, 901],
                     [1354, 1370, 1413,    0, 1437, 1420, 1388, 1373, 1374,
                     1344, 1328, 1327, 1307,    0, 1185, 1061, 903],
                     [1358, 1384, 1426, 1437, 1422, 1416, 1385, 1371, 1371,
                     1342, 1325, 1322, 1292, 1262, 1194, 1072, 906],
                     [1358, 1394,    0, 1420, 1416,    0, 1392, 1379,    0,
                     1350, 1332,    0, 1287, 1246,    0, 1079, 904],
                     [1348, 1371, 1399, 1388, 1385, 1392, 1367, 1354, 1355,
                     1326, 1307, 1300, 1258, 1217, 1169, 1060, 897],
                     [1338, 1359, 1385, 1373, 1371, 1379, 1354, 1343, 1344,
                     1314, 1295, 1287, 1244, 1204, 1156, 1049, 888],
                     [1326, 1360,    0, 1374, 1371,    0, 1355, 1343,    0,
                     1315, 1295,    0, 1244, 1203,    0, 1049, 880],
                     [1309, 1331, 1356, 1344, 1342, 1349, 1326, 1314, 1315,
                     1285, 1266, 1258, 1216, 1176, 1130, 1025, 868],
                     [1291, 1313, 1339, 1328, 1325, 1332, 1307, 1295, 1295,
                     1266, 1248, 1241, 1200, 1161, 1115, 1010, 855],
                     [1270, 1304,    0, 1327, 1322,    0, 1300, 1287,    0,
                     1258, 1241,    0, 1197, 1159,    0, 1004, 841],
                     [1237, 1260, 1298, 1307, 1292, 1287, 1258, 1244, 1244,
                     1216, 1200, 1197, 1169, 1141, 1081,  970, 821],
                     [1192, 1206, 1243,    0, 1262, 1246, 1217, 1204, 1203,
                     1176, 1161, 1159, 1141,    0, 1037,  931, 795],
                     [1131, 1139, 1160, 1185, 1194,    0, 1169, 1156,    0,
                     1130, 1115,    0, 1081, 1037,  970,  886, 765],
                     [1042, 1045, 1053, 1061, 1072, 1079, 1060, 1049, 1049,
                     1025, 1010, 1004,  970,  931,  886, 825, 729],
                     [899,  899,  901,  903,  906,  904,  897,  888,  880,
                     868,  855,  841,  821,  795,  765, 729, 675]])

    uo2_B = np.array([[628, 635, 626, 612, 594, 572, 546, 518, 490, 460, 430,
                     401, 371, 344, 327, 331, 377],
                     [635, 677, 685, 678, 665, 648, 612, 580, 554, 515, 481,
                     453, 416, 384, 362, 361, 399],
                     [626, 685, 708, 715, 703,   0, 642, 607,   0, 539, 504,
                     0, 440, 406, 377, 369, 401],
                     [612, 678, 715,   0, 704, 673, 632, 599, 571, 531, 497,
                     470, 440,   0, 382, 367, 393],
                     [594, 665, 703, 704, 680, 655, 617, 583, 556, 517, 483,
                     457, 424, 399, 374, 360, 381],
                     [572, 648,   0, 673, 655,   0, 600, 568,   0, 503, 469,
                     0, 408, 380,   0, 348, 365],
                     [546, 612, 642, 632, 617, 600, 566, 536, 511, 475, 443,
                     417, 383, 356, 339, 328, 346],
                     [518, 580, 607, 599, 583, 568, 536, 508, 484, 449, 419,
                     394, 361, 335, 319, 309, 326],
                     [490, 554,   0, 571, 556,   0, 511, 484,   0, 428, 399,
                     0, 344, 319,   0, 293, 306],
                     [460, 515, 539, 531, 517, 503, 475, 449, 428, 397, 370,
                     347, 318, 295, 281, 271, 286],
                     [430, 481, 504, 497, 483, 469, 443, 419, 399, 370, 344,
                     323, 297, 275, 261, 252, 265],
                     [401, 453,   0, 470, 457,   0, 417, 394,   0, 347, 323,
                     0, 279, 259,   0, 236, 245],
                     [371, 416, 440, 440, 424, 408, 383, 361, 344, 318, 297,
                     279, 258, 241, 226, 215, 225],
                     [344, 384, 406,   0, 399, 380, 356, 335, 319, 295, 275,
                     259, 241,   0, 207, 196, 206],
                     [327, 362, 377, 382, 374,   0, 339, 319,   0, 281, 261,
                     0, 226, 207, 190, 181, 189],
                     [331, 361, 369, 367, 359, 348, 328, 309, 293, 271, 252,
                     236, 215, 196, 181, 173, 179],
                     [377, 399, 401, 393, 381, 365, 346, 326, 306, 286, 265,
                     245, 225, 206, 189, 179, 178]])

    mox = np.array([[1518, 1238, 1106, 1038,  996,  957,  911,  865,  822,
                   773, 725, 679, 629, 587, 570, 619, 830],
                   [1507, 1434, 1271, 1202, 1170, 1153, 1064, 1008,  984,
                   902, 845, 817, 741, 679, 656, 722, 822],
                   [1502, 1422, 1284, 1256, 1214,    0, 1065, 1003,    0,
                   899, 842,   0, 767, 709, 663, 714, 816],
                   [1504, 1432, 1335,    0, 1195, 1252, 1122, 1055, 1035,
                   943, 887, 881, 748,   0, 689, 718, 814],
                   [1509, 1458, 1354, 1250, 1282, 1205, 1084, 1020, 1004,
                   912, 857, 847, 803, 699, 694, 728, 813],
                   [1508, 1490,    0, 1367, 1251,    0, 1107, 1043,    0,
                   934, 873,   0, 787, 760,   0, 742, 809],
                   [1494, 1435, 1285, 1272, 1170, 1148, 1048,  991,  977,
                   886, 829, 810, 734, 707, 653, 712, 799],
                   [1479, 1418, 1266, 1250, 1150, 1130, 1034,  978,  964,
                   875, 818, 797, 721, 693, 641, 702, 789],
                   [1466, 1440,    0, 1280, 1179,    0, 1063, 1004,    0,
                   900, 838,   0, 740, 708,   0, 711, 780],
                   [1444, 1385, 1236, 1220, 1122, 1103, 1008,  954,  940,
                   852, 796, 776, 701, 674, 624, 682, 766],
                   [1423, 1366, 1222, 1209, 1111, 1089,  994,  940,  925,
                   839, 784, 765, 693, 667, 615, 671, 752],
                   [1402, 1385,    0, 1268, 1159,    0, 1025,  964,    0,
                   862, 805,   0, 723, 697,   0, 679, 739],
                   [1368, 1324, 1230, 1134, 1162, 1091,  981,  922,  906,
                   822, 771, 761, 719, 625, 620, 649, 721],
                   [1329, 1272, 1190,    0, 1065, 1114,  997,  937,  917,
                   834, 783, 776, 657,   0, 603, 625, 703],
                   [1292, 1243, 1136, 1117, 1081,    0,  946,  889,    0,
                   794, 742,   0, 673, 621, 578, 616, 693],
                   [1270, 1267, 1159, 1111, 1086, 1070,  988,  935,  909,
                   832, 777, 748, 678, 620, 594, 640, 701],
                   [1290, 1179, 1121, 1082, 1048, 1009,  961,  911,  863,
                   810, 757, 707, 654, 608, 583, 610, 755]])

    uo2a = np.sum(uo2_A) * 1e-6
    uo2b = np.sum(uo2_B) * 1e-6
    mox = np.sum(mox) * 1e-6
    tot = uo2a + uo2b + 2*mox

    return uo2a, uo2b, mox, tot


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

    uo2a_r, uo2b_r, mox_r, tot_r = bench_power()

    file = pd.read_csv(file)
    tot = np.array(file['total_fission_heat'].tolist()[-1])
    uo2a = np.array(file['uo2a_tot'].tolist()[-1])
    uo2b = np.array(file['uo2b_tot'].tolist()[-1])
    moxa = np.array(file['moxa_tot'].tolist()[-1])
    moxb = np.array(file['moxb_tot'].tolist()[-1])

    print('uo2a: ', uo2a)
    print('uo2b: ', uo2b)
    print('moxa: ', moxa)
    print('moxb: ', moxb)
    print('tot: ', tot)

    norm = 1/tot * tot_r

    uo2a *= norm
    uo2b *= norm
    moxa *= norm
    moxb *= norm
    mox = (moxa + moxb)/2

    # print(uo2a)
    # print(uo2b)
    # print(mox)

    # print(uo2a_r)
    # print(uo2b_r)
    # print(mox_r)

    uo2a_rel = (uo2a - uo2a_r) / uo2a_r * 100
    uo2b_rel = (uo2b - uo2b_r) / uo2b_r * 100
    mox_rel = (mox - mox_r) / mox_r * 100

    # print('uo2a [%]: ', uo2a_rel)
    # print('uo2b [%]: ', uo2b_rel)
    # print('mox [%]: ', mox_rel)

    power = np.array([uo2a, mox, mox, uo2b])
    power_rel = np.array([uo2a_rel, mox_rel, mox_rel, uo2b_rel])
    return power, power_rel


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

    # coord.append(np.array([0*P+P/2, 0*P+P/2]))
    # coord.append(np.array([1*P+P/2, 0*P+P/2]))
    # coord.append(np.array([0*P+P/2, 1*P+P/2]))
    # coord.append(np.array([1*P+P/2, 1*P+P/2]))
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

    patches = np.array(patches, dtype=object)
    pc = PatchCollection(patches)

    ax = gca()
    pc.set_array(power)
    ax.add_collection(pc)
    ax.set_xlim(xmin, xmax)
    ax.set_ylim(ymin, ymax)

    cbar = plt.colorbar(pc)
    if rel is False:
        # cbar = plt.colorbar(pc)
        cbar.ax.set_ylabel('Power [W]')
        # for i in range(len(coord)):
        #     plt.text(x=coord[i][0]-F/4, y=coord[i][1]+F/5,
        #              s=np.round(power[i], 3), fontsize=20, color='w')

    else:
        cbar.ax.set_ylabel('Relative error [%]')
        # for i in range(len(coord)):
        #     plt.text(x=coord[i][0]-F/4, y=coord[i][1]-F/5,
        #              s=np.round(power[i], 3), fontsize=20, color='w')

    plt.axis('equal')
    plt.xlabel('X [cm]')
    plt.ylabel('Y [cm]')


def bench_power_pin_by_pin():
    ''' This function contains the pin-by-pin power distribution of the C5 MOX
    Benchmark. Values from Cavarec, Perron, Verwaerde, West. Benchmark
    Calculations of Power Distribution within Assemblies. 1994. p. 233.

    C5 MOX Benchmark configuration:
    _________________________
    | uo2_A |  mox  |   R   |
    |  mox  | uo2_B |   R   |
    |   R   |   R   |   R   |

    Returns:
    --------
    uo2a: [17 x 17 array of float]
        power distribution of assembly uo2_A
    uo2b: [17 x 17 array of float]
        power distribution of assembly uo2_B
    mox: [17 x 17 array of float]
        power distribution of assembly mox
    tot: [float]
        total power of the reactor
    '''

    uo2_A = np.array([[1341, 1344, 1349, 1354, 1358, 1358, 1348, 1338, 1326,
                     1309, 1291, 1270, 1237, 1192, 1131, 1042, 899],
                     [1344, 1349, 1359, 1370, 1384, 1394, 1371, 1360, 1360,
                     1331, 1313, 1304, 1260, 1206, 1139, 1045, 899],
                     [1349, 1359, 1383, 1413, 1426,    0, 1399, 1385,    0,
                     1357, 1339,    0, 1298, 1243, 1160, 1053, 901],
                     [1354, 1370, 1413,    0, 1437, 1420, 1388, 1373, 1374,
                     1344, 1328, 1327, 1307,    0, 1185, 1061, 903],
                     [1358, 1384, 1426, 1437, 1422, 1416, 1385, 1371, 1371,
                     1342, 1325, 1322, 1292, 1262, 1194, 1072, 906],
                     [1358, 1394,    0, 1420, 1416,    0, 1392, 1379,    0,
                     1350, 1332,    0, 1287, 1246,    0, 1079, 904],
                     [1348, 1371, 1399, 1388, 1385, 1392, 1367, 1354, 1355,
                     1326, 1307, 1300, 1258, 1217, 1169, 1060, 897],
                     [1338, 1359, 1385, 1373, 1371, 1379, 1354, 1343, 1344,
                     1314, 1295, 1287, 1244, 1204, 1156, 1049, 888],
                     [1326, 1360,    0, 1374, 1371,    0, 1355, 1343,    0,
                     1315, 1295,    0, 1244, 1203,    0, 1049, 880],
                     [1309, 1331, 1356, 1344, 1342, 1349, 1326, 1314, 1315,
                     1285, 1266, 1258, 1216, 1176, 1130, 1025, 868],
                     [1291, 1313, 1339, 1328, 1325, 1332, 1307, 1295, 1295,
                     1266, 1248, 1241, 1200, 1161, 1115, 1010, 855],
                     [1270, 1304,    0, 1327, 1322,    0, 1300, 1287,    0,
                     1258, 1241,    0, 1197, 1159,    0, 1004, 841],
                     [1237, 1260, 1298, 1307, 1292, 1287, 1258, 1244, 1244,
                     1216, 1200, 1197, 1169, 1141, 1081,  970, 821],
                     [1192, 1206, 1243,    0, 1262, 1246, 1217, 1204, 1203,
                     1176, 1161, 1159, 1141,    0, 1037,  931, 795],
                     [1131, 1139, 1160, 1185, 1194,    0, 1169, 1156,    0,
                     1130, 1115,    0, 1081, 1037,  970,  886, 765],
                     [1042, 1045, 1053, 1061, 1072, 1079, 1060, 1049, 1049,
                     1025, 1010, 1004,  970,  931,  886, 825, 729],
                     [899,  899,  901,  903,  906,  904,  897,  888,  880,
                     868,  855,  841,  821,  795,  765, 729, 675]])

    mox = np.array([[1518, 1238, 1106, 1038,  996,  957,  911,  865,  822,
                   773, 725, 679, 629, 587, 570, 619, 830],
                   [1507, 1434, 1271, 1202, 1170, 1153, 1064, 1008,  984,
                   902, 845, 817, 741, 679, 656, 722, 822],
                   [1502, 1422, 1284, 1256, 1214,    0, 1065, 1003,    0,
                   899, 842,   0, 767, 709, 663, 714, 816],
                   [1504, 1432, 1335,    0, 1195, 1252, 1122, 1055, 1035,
                   943, 887, 881, 748,   0, 689, 718, 814],
                   [1509, 1458, 1354, 1250, 1282, 1205, 1084, 1020, 1004,
                   912, 857, 847, 803, 699, 694, 728, 813],
                   [1508, 1490,    0, 1367, 1251,    0, 1107, 1043,    0,
                   934, 873,   0, 787, 760,   0, 742, 809],
                   [1494, 1435, 1285, 1272, 1170, 1148, 1048,  991,  977,
                   886, 829, 810, 734, 707, 653, 712, 799],
                   [1479, 1418, 1266, 1250, 1150, 1130, 1034,  978,  964,
                   875, 818, 797, 721, 693, 641, 702, 789],
                   [1466, 1440,    0, 1280, 1179,    0, 1063, 1004,    0,
                   900, 838,   0, 740, 708,   0, 711, 780],
                   [1444, 1385, 1236, 1220, 1122, 1103, 1008,  954,  940,
                   852, 796, 776, 701, 674, 624, 682, 766],
                   [1423, 1366, 1222, 1209, 1111, 1089,  994,  940,  925,
                   839, 784, 765, 693, 667, 615, 671, 752],
                   [1402, 1385,    0, 1268, 1159,    0, 1025,  964,    0,
                   862, 805,   0, 723, 697,   0, 679, 739],
                   [1368, 1324, 1230, 1134, 1162, 1091,  981,  922,  906,
                   822, 771, 761, 719, 625, 620, 649, 721],
                   [1329, 1272, 1190,    0, 1065, 1114,  997,  937,  917,
                   834, 783, 776, 657,   0, 603, 625, 703],
                   [1292, 1243, 1136, 1117, 1081,    0,  946,  889,    0,
                   794, 742,   0, 673, 621, 578, 616, 693],
                   [1270, 1267, 1159, 1111, 1086, 1070,  988,  935,  909,
                   832, 777, 748, 678, 620, 594, 640, 701],
                   [1290, 1179, 1121, 1082, 1048, 1009,  961,  911,  863,
                   810, 757, 707, 654, 608, 583, 610, 755]])

    uo2_B = np.array([[628, 635, 626, 612, 594, 572, 546, 518, 490, 460, 430,
                     401, 371, 344, 327, 331, 377],
                     [635, 677, 685, 678, 665, 648, 612, 580, 554, 515, 481,
                     453, 416, 384, 362, 361, 399],
                     [626, 685, 708, 715, 703,   0, 642, 607,   0, 539, 504,
                     0, 440, 406, 377, 369, 401],
                     [612, 678, 715,   0, 704, 673, 632, 599, 571, 531, 497,
                     470, 440,   0, 382, 367, 393],
                     [594, 665, 703, 704, 680, 655, 617, 583, 556, 517, 483,
                     457, 424, 399, 374, 360, 381],
                     [572, 648,   0, 673, 655,   0, 600, 568,   0, 503, 469,
                     0, 408, 380,   0, 348, 365],
                     [546, 612, 642, 632, 617, 600, 566, 536, 511, 475, 443,
                     417, 383, 356, 339, 328, 346],
                     [518, 580, 607, 599, 583, 568, 536, 508, 484, 449, 419,
                     394, 361, 335, 319, 309, 326],
                     [490, 554,   0, 571, 556,   0, 511, 484,   0, 428, 399,
                     0, 344, 319,   0, 293, 306],
                     [460, 515, 539, 531, 517, 503, 475, 449, 428, 397, 370,
                     347, 318, 295, 281, 271, 286],
                     [430, 481, 504, 497, 483, 469, 443, 419, 399, 370, 344,
                     323, 297, 275, 261, 252, 265],
                     [401, 453,   0, 470, 457,   0, 417, 394,   0, 347, 323,
                     0, 279, 259,   0, 236, 245],
                     [371, 416, 440, 440, 424, 408, 383, 361, 344, 318, 297,
                     279, 258, 241, 226, 215, 225],
                     [344, 384, 406,   0, 399, 380, 356, 335, 319, 295, 275,
                     259, 241,   0, 207, 196, 206],
                     [327, 362, 377, 382, 374,   0, 339, 319,   0, 281, 261,
                     0, 226, 207, 190, 181, 189],
                     [331, 361, 369, 367, 359, 348, 328, 309, 293, 271, 252,
                     236, 215, 196, 181, 173, 179],
                     [377, 399, 401, 393, 381, 365, 346, 326, 306, 286, 265,
                     245, 225, 206, 189, 179, 178]])

    uo2_A = uo2_A * 1e-6
    uo2_B = uo2_B * 1e-6
    mox = mox * 1e-6
    tot = np.sum(uo2_A + uo2_B + 2*mox)
    return uo2_A, uo2_B, mox, tot


def power_distrib_pin_by_pin(file):
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

    uo2a_r, uo2b_r, mox_r, tot_r = bench_power_pin_by_pin()

    file = pd.read_csv(file)
    tot_tot = np.array(file['total_fission_heat'].tolist()[-1])
    uo2a_tot = np.array(file['uo2a_tot'].tolist()[-1])
    uo2b_tot = np.array(file['uo2b_tot'].tolist()[-1])
    moxa_tot = np.array(file['moxa_tot'].tolist()[-1])
    moxb_tot = np.array(file['moxb_tot'].tolist()[-1])

    # print('tot: ', tot_tot)
    # print('uo2a_tot: ', uo2a_tot)
    # print('uo2b_tot: ', uo2b_tot)
    # print('moxa_tot: ', moxa_tot)
    # print('moxb_tot: ', moxb_tot)
    # print()

    uo2a = np.zeros((17, 17))
    uo2b = np.zeros((17, 17))
    moxa = np.zeros((17, 17))
    moxb = np.zeros((17, 17))
    for i in range(17):
        for j in range(17):
            try:
                uo2a[i, j] = np.array(file['uo2a_' + str(i+1) + '_' + \
                    str(j+1)].tolist()[-1])
            except KeyError:
                uo2a[i, j] = 0

            try:
                uo2b[i, j] = np.array(file['uo2b_' + str(i+1) + '_' + \
                    str(j+1)].tolist()[-1])
            except KeyError:
                uo2b[i, j] = 0

            try:
                moxa[i, j] = np.array(file['moxa_' + str(i+1) + '_' + \
                    str(j+1)].tolist()[-1])
            except KeyError:
                moxa[i, j] = 0

            try:
                moxb[i, j] = np.array(file['moxb_' + str(i+1) + '_' + \
                    str(j+1)].tolist()[-1])
            except KeyError:
                moxb[i, j] = 0

    tot = np.sum(uo2a + uo2b + moxa + moxb)

    # print('tot: ', tot)
    # print('uo2a_tot: ', np.sum(uo2a))
    # print('uo2b_tot: ', np.sum(uo2b))
    # print('moxa_tot: ', np.sum(moxa))
    # print('moxb_tot: ', np.sum(moxb))
    # print()

    # normalizes power
    norm = 1/tot * tot_r
    uo2a *= norm
    uo2b *= norm
    moxa *= norm
    moxb *= norm

    # makes the power of the mox symmetric
    mox = (moxa + moxb.T)/2

    # calculates relative error avoiding divisions by zero
    uo2a_den = uo2a_r.copy()
    uo2a_den[uo2a_den == 0] = 1
    uo2a_rel = (uo2a - uo2a_r) / uo2a_den * 100

    uo2b_den = uo2b_r.copy()
    uo2b_den[uo2b_den == 0] = 1
    uo2b_rel = (uo2b - uo2b_r) / uo2b_den * 100

    mox_den = mox_r.copy()
    mox_den[mox_den == 0] = 1
    mox_rel = (mox - mox_r) / mox_den * 100

    # print('uo2a [%]: ', uo2a_rel)
    # print('uo2b [%]: ', uo2b_rel)
    # print('mox [%]: ', mox_rel)

    # power = np.array([uo2a, mox, mox, uo2b])
    # power_rel = np.array([uo2a_rel, mox_rel, mox_rel, uo2b_rel])

    uo2a = np.reshape(uo2a, 17*17)
    uo2b = np.reshape(uo2b, 17*17)
    mox = np.reshape(mox, 17*17)

    uo2a_rel = np.reshape(np.absolute(uo2a_rel), 17*17)
    uo2b_rel = np.reshape(np.absolute(uo2b_rel), 17*17)
    mox_rel = np.reshape(np.absolute(mox_rel), 17*17)

    return uo2a, uo2b, mox, uo2a_rel, uo2b_rel, mox_rel


def plotcsv_frommoose_multi(file, save, hom=True, G=3, dire='x'):
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
    hom: [bool]
        True if plotting the solution of the homogeneous case
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
        flux0 = np.array(file['flux0_'+str(g+1)].tolist())
        flux2 = np.array(file['flux2_'+str(g+1)].tolist())
        flux = flux0 - 2*flux2

        if hom is True:
            # legend = 'PBP'
            legend = 'SP3'
            marker = 'o'
        else:
            legend = 'HET'
            marker = 'v'

        if g == 0:
            M = max(flux)
        flux /= M
        # plt.plot(d, flux, label=legend+', g='+str(g+1), marker=marker)
        plt.plot(d, flux, label=legend+', g='+str(g+1))

    plt.legend(loc='upper right')
    plt.xlabel(dire + ' [cm]')
    plt.ylabel(r'$\phi \left[\frac{n}{cm^2s}\right]$')


def plotcsv_frommoose_groups(file, save, G=2, dire='z'):
    '''
    Moltres output is a csv file.
    This function plots the values of the multi-group flux in the csv.

    Parameters:
    -----------
    file: [string]
        name of the .csv file
    save: [string]
        name of the figure to produce
    G: [int]
        number of energy groups
    dire: [char]
        direction on which the detector is applied
        values: 'x', 'y', 'z', 'r'
    '''

    file = pd.read_csv(file)
    if dire == 'r':
        x1 = np.array(file['x'].tolist())
        y1 = np.array(file['y'].tolist())
        r = np.sqrt(x1**2 + y1**2)
        x = r
    else:
        # x, y, z direction
        x = file[dire].tolist()

    group1 = file['flux1'].tolist()
    N = len(group1)
    group = np.zeros((G, N))

    for i in range(G):
        group[i] = np.array(file['flux'+str(i+1)].tolist())

    # If values are unsorted
    for i in range(G):
        group[i] = [X for _, X in sorted(zip(x, group[i]))]
    x.sort()

    # To normalize to the max value of group 1 flux
    M = max(group1)
    group /= M

    for i in range(G):
        plt.plot(x, group[i], label='DIFF, g='+str(i+1))

    if G < 20:
        plt.legend(loc="upper right", fontsize=14)
    else:
        plt.legend(loc="upper left", bbox_to_anchor=(1., 1.2), fancybox=True,
                   fontsize=14)

    plt.xticks(fontsize=14)
    plt.yticks(fontsize=14)
    plt.xlabel(dire+' [cm]', fontsize=14)
    plt.ylabel(r'$\phi \left[\frac{n}{cm^2s}\right]$', fontsize=14)


if __name__ == "__main__":

    # save = 'output-fluxes'
    # plt.figure()
    # file = 'input-2g-het_line_0001.csv'
    # plotcsv_frommoose_multi(file, save, hom=False, G=2, dire='x')
    # file = 'input-2g-power_line_0001.csv'
    # plotcsv_frommoose_multi(file, save, hom=True, G=2, dire='x')
    # plt.savefig(save, dpi=300, bbox_inches="tight")

    # save = 'output-flux-moltres'
    # plt.figure()
    # file = 'input-moltres_line_0001.csv'
    # plotcsv_frommoose_groups(file, save, G=2, dire='x')
    # plt.savefig(save, dpi=300, bbox_inches="tight")

    # save = 'output-flux-both'
    # plt.figure()
    # file = 'input-2g-power_line_0001.csv'
    # plotcsv_frommoose_multi(file, save, hom=True, G=2, dire='x')   
    # file = 'input-moltres_line_0001.csv'
    # plotcsv_frommoose_groups(file, save, G=2, dire='x')
    # plt.savefig(save, dpi=300, bbox_inches="tight")

    # power, power_rel = power_distrib('input-2g-power.csv')
    # plt.figure()
    # plot_radial_power_distribution(21.42, power)
    # plot_radial_power_distribution(21.42, power_rel, rel=True)
    # plt.savefig('distrib', dpi=300, bbox_inches="tight")
    # plt.close()

    # plt.figure()
    # power, power_rel = power_distrib('input-moltres.csv')
    # plot_radial_power_distribution(21.42, power)
    # plot_radial_power_distribution(21.42, power_rel, rel=True)
    # plt.savefig('distrib-moltres', dpi=300, bbox_inches="tight")
    # plt.close()

    uo2_p, _, _, uo2_r, _, _ = power_distrib_pin_by_pin('input-moltres.csv')
    print('uo2a max: ', np.max(uo2_r))
    # plt.figure()
    # plot_radial_power_distribution(1.26, uo2_r, rel=True)
    # plt.savefig('distrib-moltres-uo2a', dpi=300, bbox_inches="tight")
    # plt.close()

    _, uo2_p, _, _, uo2_r, _ = power_distrib_pin_by_pin('input-moltres.csv')
    print('uo2b max: ', np.max(uo2_r))
    # plt.figure()
    # plot_radial_power_distribution(1.26, uo2_r, rel=True)
    # plt.savefig('distrib-moltres-uo2b', dpi=300, bbox_inches="tight")
    # plt.close()

    _, _, mox_p, _, _, mox_r = power_distrib_pin_by_pin('input-moltres.csv')
    print('mox max: ', np.max(mox_r))
    # plt.figure()
    # plot_radial_power_distribution(1.26, mox_r, rel=True)
    # plt.savefig('distrib-moltres-mox', dpi=300, bbox_inches="tight")
    # plt.close()

    # uo2_p, _, _, uo2_r, _, _ = power_distrib_pin_by_pin('input-2g-power.csv')
    # plt.figure()
    # plot_radial_power_distribution(1.26, uo2_p, rel=False)
    # plt.savefig('uo2a-pin-by-pin', dpi=300, bbox_inches="tight")
    # plt.close()

    # plt.figure()
    # plot_radial_power_distribution(1.26, uo2_r, rel=True)
    # plt.savefig('uo2a-r-pin-by-pin', dpi=300, bbox_inches="tight")
    # plt.close()

    # _, uo2_p, _, _, uo2_r, _ = power_distrib_pin_by_pin('input-2g-power.csv')
    # plt.figure()
    # plot_radial_power_distribution(1.26, uo2_p, rel=False)
    # plt.savefig('uo2b-pin-by-pin', dpi=300, bbox_inches="tight")
    # plt.close()

    # plt.figure()
    # plot_radial_power_distribution(1.26, uo2_r, rel=True)
    # plt.savefig('uo2b-r-pin-by-pin', dpi=300, bbox_inches="tight")
    # plt.close()

    # _, _, mox_p, _, _, mox_r = power_distrib_pin_by_pin('input-2g-power.csv')
    # plt.figure()
    # plot_radial_power_distribution(1.26, mox_p, rel=False)
    # plt.savefig('mox-pin-by-pin', dpi=300, bbox_inches="tight")
    # plt.close()

    # plt.figure()
    # plot_radial_power_distribution(1.26, mox_r, rel=True)
    # plt.savefig('mox-r-pin-by-pin', dpi=300, bbox_inches="tight")
    # plt.close()
