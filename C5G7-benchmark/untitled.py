
# 1 - 68
# 137 - 204

# 69 - 136
# 205 - 272

# for i in range(17 * 17 * 2 * 4):
UO2Afuel = []
UO2Amod = []
MOXAfuel = []
MOXAmod = []

MOXBfuel = []
MOXBmod = []
UO2Bfuel = []
UO2Bmod = []

for i in range(17 * 17 * 2 * 2):
    if int(i/34)%2 == 0 and i%2 == 0:
        UO2Afuel.append(i+1)
    if int(i/34)%2 == 0 and i%2 == 1:
        UO2Amod.append(i+1)

    if int(i/34)%2 == 1 and i%2 == 0:
        MOXAfuel.append(i+1)
    if int(i/34)%2 == 1 and i%2 == 1:
        MOXAmod.append(i+1)

for i in range(17 * 17 * 2 * 2, 17 * 17 * 2 * 4):
    if int(i/34)%2 == 0 and i%2 == 0:
        MOXBfuel.append(i+1)
    if int(i/34)%2 == 0 and i%2 == 1:
        MOXBmod.append(i+1)

    if int(i/34)%2 == 1 and i%2 == 0:
        UO2Bfuel.append(i+1)
    if int(i/34)%2 == 1 and i%2 == 1:
        UO2Bmod.append(i+1)


for phvol in ['UO2Afuel', 'MOXAfuel', 'MOXBfuel', 'UO2Bfuel']:
    f = open(phvol+'.txt', 'w')
    X = globals()['phvol']
    for vol in eval(X):
        if ((vol-1)%10 == 0 or (vol-1)%34 == 0) and (vol-1)!= 0:
            f.write('\n')
        f.write(str(vol))
        f.write(', ')
    f.close()

# for phvol in ['UO2Afuel', 'UO2Amod', 'MOXAfuel', 'MOXAmod']: