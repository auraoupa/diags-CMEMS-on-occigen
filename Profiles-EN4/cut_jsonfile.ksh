head -1 /scratch/cnt0024/hmg2840/albert7a/EN4/profiles_files/NATL60-CJM165_GS_y2012-2013/NATL60-CJM165_GS_y2012-2013.json >> head.json
tail -2 /scratch/cnt0024/hmg2840/albert7a/EN4/profiles_files/NATL60-CJM165_GS_y2012-2013/NATL60-CJM165_GS_y2012-2013.json >> tail.json

for k in $(seq 1 540); do

  kfin=$((k*104))
  head -$kfin /scratch/cnt0024/hmg2840/albert7a/EN4/profiles_files/NATL60-CJM165_GS_y2012-2013/NATL60-CJM165_GS_y2012-2013.json >> test1.json
  tail -n 103 test1.json >> test2.json
  cat head.json test2.json tail.json >> /scratch/cnt0024/hmg2840/albert7a/EN4/profiles_files/NATL60-CJM165_GS_y2012-2013/NATL60-CJM165_GS_y2012-2013_${k}.json
  \rm test*

done

tail -n 43 /scratch/cnt0024/hmg2840/albert7a/EN4/profiles_files/NATL60-CJM165_GS_y2012-2013/NATL60-CJM165_GS_y2012-2013.json >> test1.json
cat head.json test1.json >> /scratch/cnt0024/hmg2840/albert7a/EN4/profiles_files/NATL60-CJM165_GS_y2012-2013/NATL60-CJM165_GS_y2012-2013_541.json

rm test1.json
