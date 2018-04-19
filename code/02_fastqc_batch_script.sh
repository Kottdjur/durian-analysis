#!/bin/bash -l

#SBATCH -A g2018003
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 1:00:00
#SBATCH -J fastqc_illumina_DNA_untrim
#SBATCH --mail-type=ALL
#SBATCH --mail-user kottdjur@hotmail.com

module load bioinfo-tools
module load FastQC/0.11.5

useGrid=false

fastqc /home/emos8710/durian-analysis/data/scaffold06_link/WGS_trimmed_data/*.fastq.gz -o /home/emos8710/durian-analysis/analyses/02_fastqc_illumina
