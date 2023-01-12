#!/bin/bash

#SBATCH -p hpc-bio-ampere
#SBATCH --chdir=/home/alumno16
#SBATCH -J lab7blast-AMGS
#SBATCH --cpus-per-task=1
#SBATCH --mail-type=END
#SBATCH --mail-user=am.garciaserna@um.es

echo 'Alineando secuencias con blast utilizando una imagen singularity'
echo
echo '1. Cargamos modulo singularity:'
module load singularity/3.8.0

echo
echo '2. Se descomprime el archivo que contiene las secuencias'
gzip -d "zebrafish.1.protein.faa.gz"

echo
echo '3. Preparación de los datos para el alineamiento:'
singularity exec /nas/hdd-0/singularity_images/blast_2.9.0--pl526h3066fca_4.sif makeblastdb -in zebrafish.1.protein.faa -dbtype prot

echo
echo '4. Alineación de las secuencias:'
singularity exec /nas/hdd-0/singularity_images/blast_2.9.0--pl526h3066fca_4.sif blastp -query P04156.fasta -db zebrafish.1.protein.faa -out results-blast.txt
echo
echo 'El programa ha finalizado. Puede consultar los resultados en el archivo results-blast.txt'
echo


#exportamos variables de entorno de SLURM
export OMP_DIR=$SLURM_SUBMIT_DIR
echo 'Directorio de trabajo: ' '$OMP_DIR'
export OMP_JOBID=$SLURM_JOBID
echo 'Id del trabajo: ' '$OMP_JOBID'

echo ${OMP_DIR} slurm-${OMP_JOBID}.out > parametros.txt

