cp NATL60-CJM165_EU_y2012-2013_new.json /scratch/cnt0024/hmg2840/albert7a/EN4/profiles_files/NATL60-CJM165_EU_y2012-2013/.

rm head.json
head -1 /scratch/cnt0024/hmg2840/albert7a/EN4/profiles_files/NATL60-CJM165_EU_y2012-2013/NATL60-CJM165_EU_y2012-2013_new.json >> head.json
rm tail.json
tail -2 /scratch/cnt0024/hmg2840/albert7a/EN4/profiles_files/NATL60-CJM165_EU_y2012-2013/NATL60-CJM165_EU_y2012-2013_new.json >> tail.json

for k in $(seq 1 124); do

  kfin=$((k*800))
  rm test1.json
  head -$kfin /scratch/cnt0024/hmg2840/albert7a/EN4/profiles_files/NATL60-CJM165_EU_y2012-2013/NATL60-CJM165_EU_y2012-2013_new.json >> test1.json
  rm test2.json
  tail -n 799 test1.json >> test2.json
  rm /scratch/cnt0024/hmg2840/albert7a/EN4/profiles_files/NATL60-CJM165_EU_y2012-2013/NATL60-CJM165_EU_y2012-2013_${k}_new.json
  cat head.json test2.json tail.json >> /scratch/cnt0024/hmg2840/albert7a/EN4/profiles_files/NATL60-CJM165_EU_y2012-2013/NATL60-CJM165_EU_y2012-2013_${k}_new.json
  
done

rm test1.json
tail -n 25 /scratch/cnt0024/hmg2840/albert7a/EN4/profiles_files/NATL60-CJM165_EU_y2012-2013/NATL60-CJM165_EU_y2012-2013_new.json >> test1.json
rm /scratch/cnt0024/hmg2840/albert7a/EN4/profiles_files/NATL60-CJM165_EU_y2012-2013/NATL60-CJM165_EU_y2012-2013_125_new.json
cat head.json test1.json >> /scratch/cnt0024/hmg2840/albert7a/EN4/profiles_files/NATL60-CJM165_EU_y2012-2013/NATL60-CJM165_EU_y2012-2013_125_new.json

rm test1.json test2.json
