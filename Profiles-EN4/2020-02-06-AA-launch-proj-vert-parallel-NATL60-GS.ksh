#!/bin/bash

#SBATCH --nodes=36
#SBATCH --ntasks=561
#SBATCH --mem=118000
#SBATCH -J prof_natlGS
#SBATCH -e prof_natlGS.e%j
#SBATCH -o prof_natlGS.o%j
#SBATCH --time=02:30:00
#SBATCH --exclusive
#SBATCH --constraint=HSW24

NB_NPROC=561 ##(4 var * 475 dates)

runcode() { srun --mpi=pmi2 -m cyclic -n $@ ; }
liste=''
reg=GS

for k in $(seq 1 561); do
    
    cp script/script_tmp_proj_vert_natl60.ksh script/NATL60${reg}-CJM165-${k}_script_proj_vert.ksh
    chmod +x script/NATL60${reg}-CJM165-${k}_script_proj_vert.ksh
    
    sed -i "s/REG/$reg/g" script/NATL60${reg}-CJM165-${k}_script_proj_vert.ksh
    sed -i "s/KK/$k/g" script/NATL60${reg}-CJM165-${k}_script_proj_vert.ksh
    liste="$liste script/NATL60${reg}-CJM165-${k}_script_proj_vert.ksh"
   
done

runcode $NB_NPROC /scratch/cnt0024/hmg2840/albert7a/bin/mpi_shell $liste


