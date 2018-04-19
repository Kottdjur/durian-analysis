#!/bin/bash -l

#SBATCH -A g2018003
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 3:00:00
#SBATCH -J trimmomatic_illumina_RNA
#SBATCH --mail-type=ALL
#SBATCH --mail-user kottdjur@hotmail.com

module load bioinfo-tools
module load trimmomatic/0.36

java -jar $TRIMMOMATIC_HOME/trimmomatic.jar PE \
-basein /home/emos8710/durian-analysis/data/scaffold06_link/RNA_raw_data/SRR6040095_scaffold_06.1.fastq.gz \
-baseout /home/emos8710/durian-analysis/analyses/05_trimmomatic_RNA/SRR6040095_trimmed.fastq.gz \
LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36
