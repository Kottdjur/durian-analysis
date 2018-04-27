#!/bin/bash -l

#SBATCH -A g2018003
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 24:00:00
#SBATCH -J canu_durian_assembly
#SBATCH --mail-type=ALL
#SBATCH --mail-user kottdjur@hotmail.com

module load bioinfo-tools
module load canu/1.7

useGrid=false

canu \
-p durian_pacbio \
-d /home/emos8710/durian-analysis/analyses/canu \
genomeSize=22m \
gnuplotTested=true \
-pacbio-raw /home/emos8710/durian-analysis/data/scaffold06_link/WGS_trimmed_data/SRR6037732_scaffold_06.fq.gz
