
# 1 - 68
# 137 - 204

# 69 - 136
# 205 - 272

# for i in range(17 * 17 * 2 * 4):
UO2A = []
for i in range(17 * 17 * 2 * 2):
    if int(i/68)%2 == 0:
        UO2A.append(i+1)

f = open('untitled.txt', 'w')
for count,vol in enumerate(UO2A):
    if (count%5 == 0 or count%68 == 0) and count != 0:
        f.write('\n')
    f.write(str(vol))
    f.write(', ')
f.close()
