#!/bin/bash

#SBATCH --nodes=1
#SBATCH --ntasks=6
#SBATCH --mem=118000
#SBATCH -J proj_vert
#SBATCH -e proj_vert.e%j
#SBATCH -o proj_vert.o%j
#SBATCH --time=12:30:00
#SBATCH --exclusive
#SBATCH --constraint=HSW24

NB_NPROC=6 ##(4 var * 475 dates)

runcode() { srun --mpi=pmi2 -m cyclic -n $@ ; }
liste=''

for REG in EU GS; do
  for CASE in MPC001 MPC002 MPC003; do

        cp script/tmp_proj_vert.ksh script/${REG}-${CASE}_script-proj-vert.ksh
	chmod +x script/${REG}-${CASE}_script-proj-vert.ksh

    	sed -i "s/CCASE/$CASE/g" script/${REG}-${CASE}_script-proj-vert.ksh
    	sed -i "s/REG/$REG/g" script/${REG}-${CASE}_script-proj-vert.ksh
    	liste="$liste script/${REG}-${CASE}_script-proj-vert.ksh "

  done   
done

runcode $NB_NPROC /scratch/cnt0024/hmg2840/albert7a/bin/mpi_shell $liste


