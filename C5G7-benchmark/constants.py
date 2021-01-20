import numpy as np
import os
from os import path
import shutil


def update_dict(dictio, key, value):
    ''' updates dictionary by adding a key with an associated value
    '''
    dictio[key] = value
    return dictio


def uo2_properties():
    # UO2
    mat = {}
    value = np.array([2.1245e-1, 3.5547e-1, 4.8554e-1, 5.5940e-1, 3.1803e-1,
                     4.0146e-1, 5.7061e-1])
    mat = update_dict(mat, 'totxs', value)
    value = np.array([1.77949e-1, 3.29805e-1, 4.80388e-1, 5.54367e-1,
                     3.11801e-1, 3.95168e-1, 5.64406e-1])
    mat = update_dict(mat, 'trxs', value)
    value = np.array([8.0248e-3, 3.7174e-3, 2.6769e-2, 9.6236e-2, 3.002e-2,
                     1.1126e-1, 2.8278e-1])
    mat = update_dict(mat, 'absxs', value)
    value = np.array([8.1274e-4, 2.8981e-3, 2.03158e-2, 7.76712e-2,
                     1.22116e-2, 2.82252e-2, 6.6776e-2])
    mat = update_dict(mat, 'capxs', value)
    value = np.array([7.21206e-3, 8.19301e-4, 6.4532e-3, 1.85648e-2,
                     1.78084e-2, 8.30348e-2, 2.16004e-1])
    mat = update_dict(mat, 'fisxs', value)
    value = np.array([2.78145, 2.47443, 2.43383, 2.4338, 2.4338, 2.4338,
                     2.4338])
    mat = update_dict(mat, 'nu', value)
    value = np.array([5.8791e-1, 4.1176e-1, 3.3906e-4, 1.1761e-7, 0.0, 0.0,
                     0.0])
    mat = update_dict(mat, 'chi', value)
    value = np.array([[1.27537e-1, 4.2378e-2, 9.4374e-6, 5.5163e-9, 0.0, 0.0,
                     0.0], [0.0, 3.24456e-1, 1.6314e-3, 3.1427e-9, 0.0, 0.0,
                     0.0], [0.0, 0.0, 4.5094e-1, 2.6792e-3, 0.0, 0.0, 0.0],
                     [0.0, 0.0, 0.0, 4.52565e-1, 5.5664e-3, 0.0, 0.0], [0.0,
                     0.0, 0.0, 1.2525e-4, 2.71401e-1, 1.0255e-2, 1.0021e-8],
                     [0.0, 0.0, 0.0, 0.0, 1.2968e-3, 2.65802e-1, 1.6809e-2],
                     [0.0, 0.0, 0.0, 0.0, 0.0, 8.5458e-3, 2.7308e-1]])
    mat = update_dict(mat, 'scxs', value)

    mat2 = prepare_xs(mat)
    return mat2


def mox1_properties():
    # MOX 8.7%
    mat = {}
    value = np.array([2.1628e-1, 3.617e-1, 5.0563e-1, 6.1117e-1, 5.089e-1,
                     9.2667e-1, 9.6099e-1])
    mat = update_dict(mat, 'totxs', value)
    value = np.array([1.83045e-1, 3.36705e-1, 5.00507e-1, 6.06174e-1,
                     5.02754e-1, 9.21028e-1, 9.55231e-1])
    mat = update_dict(mat, 'trxs', value)
    value = np.array([9.4862e-3, 4.6556e-3, 3.624e-2, 1.3272e-1, 2.084e-1,
                     6.587e-1, 6.9017e-1])
    mat = update_dict(mat, 'absxs', value)
    value = np.array([8.1411e-4, 3.03134e-3, 2.59684e-2, 9.36753e-2,
                     1.89142e-1, 2.83812e-1, 2.59571e-1])
    mat = update_dict(mat, 'capxs', value)
    value = np.array([8.67209e-3, 1.62426e-3, 1.02716e-2, 3.90447e-2,
                     1.92576e-2, 3.74888e-1, 4.30599e-1])
    mat = update_dict(mat, 'fisxs', value)
    value = np.array([2.90426, 2.91795, 2.86986, 2.87491, 2.87175, 2.86752,
                     2.87808])
    mat = update_dict(mat, 'nu', value)
    value = np.array([5.8791e-1, 4.1176e-1, 3.3906e-4, 1.1761e-7, 0.0, 0.0,
                     0.0])
    mat = update_dict(mat, 'chi', value)
    value = np.array([[1.31504e-1, 4.2046e-2, 8.6972e-6, 5.1938e-9, 0.0, 0.0,
                     0.0], [0.0, 3.30403e-1, 1.6463e-3, 2.6006e-9, 0.0, 0.0,
                     0.0], [0.0, 0.0, 4.61792e-1, 2.4749e-3, 0.0, 0.0, 0.0],
                     [0.0, 0.0, 0.0, 4.68021e-1, 5.433e-3, 0.0, 0.0], [0.0,
                     0.0, 0.0, 1.8597e-4, 2.85771e-1, 8.3973e-3, 8.928e-9],
                     [0.0, 0.0, 0.0, 0.0, 2.3916e-3, 2.47614e-1, 1.2322e-2],
                     [0.0, 0.0, 0.0, 0.0, 0.0, 8.9681e-3, 2.56093e-1]])
    mat = update_dict(mat, 'scxs', value)

    mat2 = prepare_xs(mat)
    return mat2


def mox2_properties():
    # MOX 7%
    mat = {}
    value = np.array([2.1454e-1, 3.5935e-1, 4.9891e-1, 5.9622e-1, 4.8035e-1,
                     8.3936e-1, 8.5948e-1])
    mat = update_dict(mat, 'totxs', value)
    value = np.array([1.81323e-1, 3.34368e-1, 4.93785e-1, 5.91216e-1,
                     4.74198e-1, 8.33601e-1, 8.53603e-1])
    mat = update_dict(mat, 'trxs', value)
    value = np.array([9.0657e-3, 4.2967e-3, 3.2881e-2, 1.2203e-1, 1.8298e-1,
                     5.6846e-1, 5.8521e-1])
    mat = update_dict(mat, 'absxs', value)
    value = np.array([8.1124e-4, 2.97105e-3, 2.44594e-2, 8.9157e-2,
                     1.67016e-1, 2.44666e-1, 2.22407e-1])
    mat = update_dict(mat, 'capxs', value)
    value = np.array([8.25446e-3, 1.32565e-3, 8.42156e-3, 3.2873e-2,
                     1.59636e-2, 3.23794e-1, 3.62803e-1])
    mat = update_dict(mat, 'fisxs', value)
    value = np.array([2.88498, 2.91079, 2.86574, 2.87063, 2.86714, 2.86658,
                     2.87539])
    mat = update_dict(mat, 'nu', value)
    value = np.array([5.8791e-1, 4.1176e-1, 3.3906e-4, 1.1761e-7, 0.0, 0.0,
                     0.0])
    mat = update_dict(mat, 'chi', value)
    value = np.array([[1.30457e-1, 4.1792e-2, 8.5105e-6, 5.1329e-9, 0.0, 0.0,
                     0.0], [0.0, 3.28428e-1, 1.6436e-3, 2.2017e-9, 0.0, 0.0,
                     0.0], [0.0, 0.0, 4.58371e-1, 2.5331e-3, 0.0, 0.0, 0.0],
                     [0.0, 0.0, 0.0, 4.63709e-1, 5.4766e-3, 0.0, 0.0], [0.0,
                     0.0, 0.0, 1.7619e-4, 2.82313e-1, 8.7289e-3, 9.0016e-9],
                     [0.0, 0.0, 0.0, 0.0, 2.276e-3, 2.49751e-1, 1.3114e-2],
                     [0.0, 0.0, 0.0, 0.0, 0.0, 8.8645e-3, 2.59529e-1]])
    mat = update_dict(mat, 'scxs', value)

    mat2 = prepare_xs(mat)
    return mat2


def mox3_properties():
    # MOX 4.3%
    mat = {}
    value = np.array([2.1192e-1, 3.5581e-1, 4.889e-1, 5.7194e-1, 4.3239e-1,
                     6.8495e-1, 6.8891e-1])
    mat = update_dict(mat, 'totxs', value)
    value = np.array([1.78731e-1, 3.30849e-1, 4.83772e-1, 5.66922e-1,
                     4.26227e-1, 6.78997e-1, 6.82852e-1])
    mat = update_dict(mat, 'trxs', value)
    value = np.array([8.4339e-3, 3.7577e-3, 2.797e-2, 1.0421e-1, 1.3994e-1,
                     4.0918e-1, 4.0935e-1])
    mat = update_dict(mat, 'absxs', value)
    value = np.array([8.0686e-4, 2.8808e-3, 2.22717e-2, 8.13228e-2,
                     1.29177e-1, 1.76423e-1, 1.60382e-1])
    mat = update_dict(mat, 'capxs', value)
    value = np.array([7.62704e-3, 8.76898e-4, 5.69835e-3, 2.28872e-2,
                     1.07635e-2, 2.32757e-1, 2.48968e-1])
    mat = update_dict(mat, 'fisxs', value)
    value = np.array([2.85209, 2.89099, 2.85486, 2.86073, 2.85447, 2.86415,
                     2.8678])
    mat = update_dict(mat, 'nu', value)
    value = np.array([5.8791e-1, 4.1176e-1, 3.3906e-4, 1.17610e-7, 0.0, 0.0,
                     0.0])
    mat = update_dict(mat, 'chi', value)
    value = np.array([[1.28876e-1, 4.1413e-2, 8.229e-6, 5.0405e-9, 0.0, 0.0,
                     0.0], [0.0, 3.25452e-1, 1.6395e-3, 1.5982e-9, 0.0, 0.0,
                     0.0], [0.0, 0.0, 4.53188e-1, 2.6142e-3, 0.0, 0.0, 0.0],
                     [0.0, 0.0, 0.0, 4.57173e-1, 5.5394e-3, 0.0, 0.0], [0.0,
                     0.0, 0.0, 1.6046e-4, 2.76814e-1, 9.3127e-3, 9.1656e-9],
                     [0.0, 0.0, 0.0, 0.0, 2.0051e-3, 2.52962e-1, 1.485e-2],
                     [0.0, 0.0, 0.0, 0.0, 0.0, 8.4948e-3, 2.65007e-1]])
    mat = update_dict(mat, 'scxs', value)

    mat2 = prepare_xs(mat)
    return mat2


def fission_properties():
    # Fission chamber
    mat = {}
    value = np.array([1.9073e-1, 4.5652e-1, 6.407e-1, 6.4984e-1, 6.7063e-1,
                     8.7506e-1, 1.4345e0])
    mat = update_dict(mat, 'totxs', value)
    value = np.array([1.26032e-1, 2.9316e-1, 2.8425e-1, 2.8102e-1, 3.3446e-1,
                     5.6564e-1, 1.17214])
    mat = update_dict(mat, 'trxs', value)
    value = np.array([5.1132e-4, 7.5813e-5, 3.1643e-4, 1.1675e-3, 3.3977e-3,
                     9.1886e-3, 2.3244e-2])
    mat = update_dict(mat, 'absxs', value)
    value = np.array([5.11315e-4, 7.58072e-5, 3.15966e-4, 1.16226e-3,
                     3.39755e-3, 9.18789e-3, 2.32419e-2])
    mat = update_dict(mat, 'capxs', value)
    value = np.array([4.79002e-9, 5.82564e-9, 4.63719e-7, 5.24406e-6,
                     1.4539e-7, 7.14972e-7, 2.08041e-6])
    mat = update_dict(mat, 'fisxs', value)
    value = np.array([2.76283, 2.46239, 2.4338, 2.4338, 2.4338, 2.4338,
                     2.4338])
    mat = update_dict(mat, 'nu', value)
    value = np.array([5.8791e-1, 4.1176e-1, 3.3906e-4, 1.1761e-7, 0.0, 0.0,
                     0.0])
    mat = update_dict(mat, 'chi', value)
    value = np.array([[6.61659e-2, 5.907e-2, 2.8334e-4, 1.4622e-6, 2.0642e-8,
                     0.0, 0.0], [0.0, 2.40377e-1, 5.2435e-2, 2.499e-4,
                     1.9239e-5, 2.9875e-6, 4.214e-7], [0.0, 0.0, 1.83425e-1,
                     9.2288e-2, 6.9365e-3, 1.079e-3, 2.0543e-4], [0.0, 0.0,
                     0.0, 7.90769e-2, 1.6999e-1, 2.586e-2, 4.9256e-3], [0.0,
                     0.0, 0.0, 3.734e-5, 9.9757e-2, 2.0679e-1, 2.4478e-2],
                     [0.0, 0.0, 0.0, 0.0, 9.1742e-4, 3.16774e-1, 2.3876e-1],
                     [0.0, 0.0, 0.0, 0.0, 0.0, 4.9793e-2, 1.0991]])
    mat = update_dict(mat, 'scxs', value)

    mat2 = prepare_xs(mat)
    return mat2


def guide_properties():
    # Guide tube
    mat = {}
    value = np.array([1.9073e-1, 4.5652e-1, 6.4067e-1, 6.4967e-1, 6.7058e-1,
                     8.7505e-1, 1.4345])
    mat = update_dict(mat, 'totxs', value)
    value = np.array([1.26032e-1, 2.9316e-1, 2.8424e-1, 2.8096e-1, 3.3444e-1,
                     5.6564e-1, 1.17215])
    mat = update_dict(mat, 'trxs', value)
    value = np.array([5.1132e-4, 7.5801e-5, 3.1572e-4, 1.1582e-3, 3.3975e-3,
                     9.1878e-3, 2.3242e-2])
    mat = update_dict(mat, 'absxs', value)
    mat = update_dict(mat, 'capxs', value)
    value = np.array([[6.61659e-2, 5.907e-2, 2.8334e-4, 1.4622e-6, 2.0642e-8,
                     0.0, 0.0], [0.0, 2.40377e-1, 5.2435e-2, 2.499e-4,
                     1.9239e-5, 2.9875e-6, 4.214e-7], [0.0, 0.0, 1.83297e-1,
                     9.2397e-2, 6.9446e-3, 1.0803e-3, 2.0567e-4], [0.0, 0.0,
                     0.0, 7.88511e-2, 1.7014e-1, 2.5881e-2, 4.9297e-3], [0.0,
                     0.0, 0.0, 3.7333e-5, 9.97372e-2, 2.0679e-1, 2.4478e-2],
                     [0.0, 0.0, 0.0, 0.0, 9.1726e-4, 3.16765e-1, 2.3877e-1],
                     [0.0, 0.0, 0.0, 0.0, 0.0, 4.9792e-2, 1.09912]])
    mat = update_dict(mat, 'scxs', value)

    mat2 = prepare_xs(mat)
    return mat2


def moderator_properties():
    # Moderator
    mat = {}
    value = np.array([2.3007e-1, 7.7646e-1, 1.4842, 1.5052, 1.5592, 2.0254,
                     3.3057])
    mat = update_dict(mat, 'totxs', value)
    value = np.array([1.59206e-1, 4.1297e-1, 5.9031e-1, 5.8435e-1, 7.18e-1,
                     1.25445, 2.65038])
    mat = update_dict(mat, 'trxs', value)
    value = np.array([6.0105e-4, 1.5793e-5, 3.3716e-4, 1.9406e-3, 5.7416e-3,
                     1.5001e-2, 3.7239e-2])
    mat = update_dict(mat, 'absxs', value)
    mat = update_dict(mat, 'capxs', value)
    value = np.array([[4.44777e-2, 1.134e-1, 7.2347e-4, 3.7499e-6, 5.3184e-8,
                     0.0, 0.0], [0.0, 2.82334e-1, 1.2994e-1, 6.234e-4,
                     4.8002e-5, 7.4486e-6, 1.0455e-6], [0.0, 0.0, 3.45256e-1,
                     2.2457e-1, 1.6999e-2, 2.6443e-3, 5.0344e-4], [0.0, 0.0,
                     0.0, 9.10284e-2, 4.1551e-1, 6.3732e-2, 1.2139e-2], [0.0,
                     0.0, 0.0, 7.1437e-5, 1.39138e-1, 5.1182e-1, 6.1229e-2],
                     [0.0, 0.0, 0.0, 0.0, 2.2157e-3, 6.99913e-1, 5.3732e-1],
                     [0.0, 0.0, 0.0, 0.0, 0.0, 1.32440e-1, 2.4807]])
    mat = update_dict(mat, 'scxs', value)

    mat2 = prepare_xs(mat)
    return mat2


def prepare_xs(mat):
    mat2 = {}

    G = len(mat['totxs'])
    remxs = mat['totxs'] - mat['scxs'].reshape((G, G)).diagonal()

    mat2['DIFFCOEFA'] = 1./3./mat['totxs']
    # mat2['DIFFCOEFA'] = 1./3./mat1['trxs']

    mat2['DIFFCOEFB'] = 9./35./mat['totxs']
    mat2['REMXSA'] = remxs
    mat2['REMXSB'] = mat['totxs'] + 4./5 * remxs
    mat2['COUPLEXSA'] = 2 * remxs
    mat2['COUPLEXSB'] = 2./5 * remxs
    mat2['SP0'] = mat['scxs']

    try:
        mat2['NSF'] = mat['nu'] * mat['fisxs']
    except KeyError:
        mat2['NSF'] = np.zeros(G)

    try:
        mat2['CHIT'] = mat['chi']
    except KeyError:
        mat2['CHIT'] = np.zeros(G)

    try:
        mat2['FISS'] = mat['fisxs']
    except KeyError:
        mat2['FISS'] = np.zeros(G)

    mat2['KAPPA'] = np.ones(G) * 200
    mat2['CHIP'] = np.zeros(G)
    mat2['CHID'] = np.zeros(G)
    mat2['INVV'] = np.zeros(G)
    mat2['BETA_EFF'] = np.zeros(8)
    mat2['LAMBDA'] = np.zeros(8)

    return mat2


def create_xs(outdir, temp, materials):
    '''
    This function outputs the dictionary with the material cross-sections
    into the SP3 App readable format.

    '''
    for currentMat in materials.keys():
        for data in materials[currentMat].keys():

            with open(outdir + '/' + currentMat +
                      '_' + data + '.txt', 'a') as fh:

                strData = materials[currentMat][data]
                strData = ' '.join(
                    [str(dat) for dat in strData]) if isinstance(
                    strData, np.ndarray) else strData
                fh.write(str(temp) + ' ' + strData)
                fh.write('\n')


if __name__ == "__main__":

    materials = {}
    materials['uo2'] = uo2_properties()
    materials['mox1'] = mox1_properties()
    materials['mox2'] = mox2_properties()
    materials['mox3'] = mox3_properties()
    materials['fisc'] = fission_properties()
    materials['gtube'] = guide_properties()
    materials['moder'] = moderator_properties()
    materials['reflec'] = moderator_properties()

    temp = 300
    outdir = 'xs7g'
    if os.path.exists(outdir):
        shutil.rmtree(outdir)
    os.mkdir(outdir)
    create_xs(outdir, temp, materials)
