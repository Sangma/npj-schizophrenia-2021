
for tract in `cat tractlist.txt`
do
for file in `cat list.txt`
do
    echo $file
    fslmaths $file/$tract/tracts/tractsNormp20.nii.gz -sub  $file/$tract/tracts/tractsNormp05.nii.gz $file/$tract/tracts/tractsNormp20-05.nii.gz
done 
done
