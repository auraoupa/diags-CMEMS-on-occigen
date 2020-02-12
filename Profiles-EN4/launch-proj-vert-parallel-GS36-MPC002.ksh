#!/bin/bash

#SBATCH --nodes=36
#SBATCH --ntasks=561
#SBATCH --mem=118000
#SBATCH -J compute_prof
#SBATCH -e compute_prof.e%j
#SBATCH -o compute_prof.o%j
#SBATCH --time=02:30:00
#SBATCH --exclusive
#SBATCH --constraint=HSW24

NB_NPROC=561 ##(4 var * 475 dates)

runcode() { srun --mpi=pmi2 -m cyclic -n $@ ; }
liste=''

CONFIG=GS36
CASE=MPC002

case $CONFIG in
    GS36) reg=GS;;
    EU36) reg=EU;;
esac

for k in $(seq 1 561); do
    
    cp script/script_tmp_proj_vert.ksh script/${CONFIG}-${CASE}-${k}_script_proj_vert.ksh
    chmod +x script/${CONFIG}-${CASE}-${k}_script_proj_vert.ksh
    
    sed -i "s/CONFIG/$CONFIG/g" script/${CONFIG}-${CASE}-${k}_script_proj_vert.ksh
    sed -i "s/CASE/$CASE/g" script/${CONFIG}-${CASE}-${k}_script_proj_vert.ksh
    sed -i "s/REG/$reg/g" script/${CONFIG}-${CASE}-${k}_script_proj_vert.ksh
    sed -i "s/KK/$k/g" script/${CONFIG}-${CASE}-${k}_script_proj_vert.ksh
    liste="$liste script/${CONFIG}-${CASE}-${k}_script_proj_vert.ksh"
   
done

runcode $NB_NPROC /scratch/cnt0024/hmg2840/albert7a/bin/mpi_shell $liste


