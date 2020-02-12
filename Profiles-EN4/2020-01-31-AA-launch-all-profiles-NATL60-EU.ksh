#!/bin/bash

#SBATCH --nodes=6
#SBATCH --ntasks=125
#SBATCH --mem=118000
#SBATCH -J prof_natlEU
#SBATCH -e prof_natlEU.e%j
#SBATCH -o prof_natlEU.o%j
#SBATCH --time=02:30:00
#SBATCH --exclusive
#SBATCH --constraint=HSW24

NB_NPROC=125 ##(4 var * 475 dates)

runcode() { srun --mpi=pmi2 -m cyclic -n $@ ; }
liste=''
reg=EU

for k in $(seq 1 125); do
    
    cp script/script_tmp_natl60.ksh script/NATL60${reg}-CJM165-${k}_script.ksh
    chmod +x script/NATL60${reg}-CJM165-${k}_script.ksh
    
    sed -i "s/REG/$reg/g" script/NATL60${reg}-CJM165-${k}_script.ksh
    sed -i "s/KK/$k/g" script/NATL60${reg}-CJM165-${k}_script.ksh
    liste="$liste script/NATL60${reg}-CJM165-${k}_script.ksh"
   
done

runcode $NB_NPROC /scratch/cnt0024/hmg2840/albert7a/bin/mpi_shell $liste


