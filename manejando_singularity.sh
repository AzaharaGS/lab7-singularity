#!/bin/bash
module load singularity/3.8.0
echo 'Lab 7: Manejando singularity'
echo
echo 'Apartado a) Mostramos el nombre de la máquina en la que estamos '
echo
echo '- Ibsen:'
hostname
echo
echo '- Singularity:'
singularity exec ./singularity/my-python.sif hostname
echo
echo 'Apartado b) Mostramos el archivo os-release'
echo
echo '- Ibsen:'
cat /etc/os-release
echo
echo '- Singularity:'
singularity exec ./singularity/my-python.sif cat /etc/os-release 
echo
echo 'Apartado c) Mostramos el directorio actual'
echo
echo '- Ibsen:'
pwd
echo
echo '- Singularity:'
singularity exec ./singularity/my-python.sif pwd 
echo
echo 'Apartado d) Mostramos el contenido del directorio home'
echo
echo '- Ibsen:'
ls -l /home
echo
echo '- Singularity:'
singularity exec ./singularity/my-python.sif ls -l /home 
echo
echo 'Apartado e) Mostramos la versión del python instalado en la imagen my-python.sif'
echo
echo '- Ibsen:'
python --version
echo
echo '- Singularity:'
singularity exec ./singularity/my-python.sif python --version 
echo
echo 'Apartado f.1) Ejecutamos el notebook kmer-solution.ipynb dentro del subdirectorio source de la imagen Singularity'
echo
echo '- Singularity:'
singularity exec ./singularity/my-python.sif ipython ./source/kmer-solution.ipynb 
echo
echo 'Apartado f.2) Ejecutamos el notebook kmer-solution.ipynb dentro del propio contenedor de Singularity'
echo
echo '- Singularity:'
singularity exec ./singularity/my-python.sif ipython  /home/kmer-solution.ipynb 





module unload singularity/3.8.0
