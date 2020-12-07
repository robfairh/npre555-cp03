# Step 1: Uncomment these lines to create .coe
cp fullcore3G-LBP.coe fuel.coe
cp fullcore3G-LBP.coe brefl.coe
cp fullcore3G-LBP.coe trefl.coe
sed -i '2s/.*/1 fuel0/' fuel.coe
sed -i '2s/.*/1 brefl0/' brefl.coe
sed -i '2s/.*/1 trefl0/' trefl.coe

# Step 2: Uncomment these lines to create XS
> tempMapping
echo 'fuel0 300' >> tempMapping
echo 'brefl0 300' >> tempMapping
echo 'trefl0 300' >> tempMapping

> secBranch

> universeMapping
echo 'fuel 9' >> universeMapping
echo 'trefl B' >> universeMapping
echo 'brefl T' >> universeMapping

$MOLTRES/python/extractSerpent2GCs.py xs3g mhtgr tempMapping secBranch universeMapping

rm fuel.coe
rm brefl.coe
rm trefl.coe
rm tempMapping
rm secBranch
rm universeMapping
