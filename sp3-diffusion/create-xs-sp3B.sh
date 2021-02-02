# Step 1: Uncomment these lines to create .coe
cp fullcore3G-LBP.coe fuel.coe
sed -i '2s/.*/1 fuel0/' fuel.coe

# Step 2: Uncomment these lines to create XS
> tempMapping
echo 'fuel0 300' >> tempMapping

> universeMapping
echo 'fuel 9' >> universeMapping

mkdir xs3g-sp3
python constantsB.py xs1g-sp3B mhtgr tempMapping universeMapping

rm fuel.coe
rm tempMapping
rm universeMapping
