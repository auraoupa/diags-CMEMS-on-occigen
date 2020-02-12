#!/bin/bash

if [ $# != 2 ] ; then
   echo USAGE: 2020-01-30-AA-launch-10-times-all-profiles-regional-simus.ksh reg CASE
   exit 0
fi

CASE=$2
reg=$1

if [ $reg == 'GS' ]; then

	CONFIG=GS36
	namezone=NATL60-CJM165_GS_y2012-2013
	dirn=/scratch/cnt0024/hmg2840/albert7a/EN4/profiles_files/NATL60-CJM165_${reg}_y2012-2013/${CONFIG}-${CASE}
	for k in $(seq 1 563); do
		jsonfile=/scratch/cnt0024/hmg2840/albert7a/EN4/profiles_files/NATL60-CJM165_GS_y2012-2013/NATL60-CJM165_GS_y2012-2013_${k}.json
		echo "Dealing with " $jsonfile
		python /scratch/cnt0024/hmg2840/albert7a/DEV/git/diags-CMEMS-on-occigen/Profiles-EN4/2020-01-29-AA-proj-vert-standart-levels.py --jsonfile $jsonfile --dir $dirn --conf $CONFIG --case 'MPC001' --nz 'NATL60-CJM165_GS_y2012-2013'
	done

fi

if [ $reg == 'EU' ]; then

        CONFIG=EU36
        namezone=NATL60-CJM165_EU_y2012-2013
        dirn=/scratch/cnt0024/hmg2840/albert7a/EN4/profiles_files/NATL60-CJM165_${reg}_y2012-2013/${CONFIG}-${CASE}
        for k in $(seq 1 282); do
                jsonfile=/scratch/cnt0024/hmg2840/albert7a/EN4/profiles_files/NATL60-CJM165_EU_y2012-2013/NATL60-CJM165_EU_y2012-2013_${k}.json
                echo "Dealing with " $jsonfile
                python /scratch/cnt0024/hmg2840/albert7a/DEV/git/diags-CMEMS-on-occigen/Profiles-EN4/2020-01-29-AA-proj-vert-standart-levels.py --jsonfile $jsonfile --dir $dirn --conf $CONFIG --case 'MPC001' --nz 'NATL60-CJM165_EU_y2012-2013'
        done


fi

