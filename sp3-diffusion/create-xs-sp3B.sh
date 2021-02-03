# Step 1: Uncomment these lines to create .coe
cp fullcore3G-LBP.coe fuel.coe
sed -i '2s/.*/1 fuel0/' fuel.coe

# Step 2: Uncomment these lines to create XS
> universeMapping
echo 'fuel 9' >> universeMapping

mkdir xs3g-sp3
python constantsB.py universeMapping

rm fuel.coe
rm universeMapping
