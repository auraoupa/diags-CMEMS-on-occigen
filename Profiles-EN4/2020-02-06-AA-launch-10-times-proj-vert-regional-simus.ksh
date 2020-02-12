#!/bin/bash

if [ $# != 2 ] ; then
   echo USAGE: 2020-01-30-AA-launch-10-times-proj-vert-parallel-regional-simus.ksh reg CASE
   exit 0
fi

CASE=$2
reg=$1

if [ $reg == 'GS' ]; then

	cp /scratch/cnt0024/hmg2840/albert7a/DEV/git/diags-CMEMS-on-occigen/Profiles-EN4/2020-02-06-AA-launch-proj-vert-parallel-GS36.ksh launch-proj-vert-parallel-GS36-${CASE}.ksh

	sed -i "s/CCASE/$CASE/g" launch-proj-vert-parallel-GS36-${CASE}.ksh
	chmod +x launch-proj-vert-parallel-GS36-${CASE}.ksh

	jobid1=$(sbatch launch-proj-vert-parallel-GS36-${CASE}.ksh | awk '{print $4}')
	jobid2=$(sbatch --dependency=afterany:$jobid1 --time=02:30:00 launch-proj-vert-parallel-GS36-${CASE}.ksh | awk '{print $4}' )
	jobid3=$(sbatch --dependency=afterany:$jobid2 --time=02:30:00 launch-proj-vert-parallel-GS36-${CASE}.ksh | awk '{print $4}')
	jobid4=$(sbatch --dependency=afterany:$jobid3 --time=02:30:00 launch-proj-vert-parallel-GS36-${CASE}.ksh | awk '{print $4}')
	jobid5=$(sbatch --dependency=afterany:$jobid4 --time=02:30:00 launch-proj-vert-parallel-GS36-${CASE}.ksh | awk '{print $4}')
	jobid6=$(sbatch --dependency=afterany:$jobid5 --time=02:30:00 launch-proj-vert-parallel-GS36-${CASE}.ksh | awk '{print $4}')
	jobid7=$(sbatch --dependency=afterany:$jobid6 --time=02:30:00 launch-proj-vert-parallel-GS36-${CASE}.ksh | awk '{print $4}')
	jobid8=$(sbatch --dependency=afterany:$jobid7 --time=02:30:00 launch-proj-vert-parallel-GS36-${CASE}.ksh | awk '{print $4}')
	jobid9=$(sbatch --dependency=afterany:$jobid8 --time=02:30:00 launch-proj-vert-parallel-GS36-${CASE}.ksh | awk '{print $4}')
	sbatch --dependency=afterany:$jobid9 --time=02:30:00 launch-proj-vert-parallel-GS36-${CASE}.ksh
fi

if [ $reg == 'EU' ] ; then


	cp /scratch/cnt0024/hmg2840/albert7a/DEV/git/diags-CMEMS-on-occigen/Profiles-EN4/2020-02-06-AA-launch-proj-vert-parallel-EU36.ksh launch-proj-vert-parallel-EU36-${CASE}.ksh

	sed -i "s/CCASE/$CASE/g" launch-proj-vert-parallel-EU36-${CASE}.ksh
	chmod +x launch-proj-vert-parallel-EU36-${CASE}.ksh

	jobid1=$(sbatch launch-proj-vert-parallel-EU36-${CASE}.ksh | awk '{print $4}')
	jobid2=$(sbatch --dependency=afterany:$jobid1 --time=02:30:00 launch-proj-vert-parallel-EU36-${CASE}.ksh | awk '{print $4}')
	jobid3=$(sbatch --dependency=afterany:$jobid2 --time=02:30:00 launch-proj-vert-parallel-EU36-${CASE}.ksh | awk '{print $4}')
	jobid4=$(sbatch --dependency=afterany:$jobid3 --time=02:30:00 launch-proj-vert-parallel-EU36-${CASE}.ksh | awk '{print $4}')
	jobid5=$(sbatch --dependency=afterany:$jobid4 --time=02:30:00 launch-proj-vert-parallel-EU36-${CASE}.ksh | awk '{print $4}')
	jobid6=$(sbatch --dependency=afterany:$jobid5 --time=02:30:00 launch-proj-vert-parallel-EU36-${CASE}.ksh | awk '{print $4}')
	jobid7=$(sbatch --dependency=afterany:$jobid6 --time=02:30:00 launch-proj-vert-parallel-EU36-${CASE}.ksh | awk '{print $4}')
	jobid8=$(sbatch --dependency=afterany:$jobid7 --time=02:30:00 launch-proj-vert-parallel-EU36-${CASE}.ksh | awk '{print $4}')
	jobid9=$(sbatch --dependency=afterany:$jobid8 --time=02:30:00 launch-proj-vert-parallel-EU36-${CASE}.ksh | awk '{print $4}')
	sbatch --dependency=afterany:$jobid9 --time=02:30:00 launch-proj-vert-parallel-EU36-${CASE}.ksh

fi
