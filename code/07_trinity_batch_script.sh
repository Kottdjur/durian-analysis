#!/bin/bash -l

#SBATCH -A g2018003
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 15:00:00
#SBATCH -J trinity_RNA_assembly
#SBATCH --mail-type=ALL
#SBATCH --mail-user kottdjur@hotmail.com

module load bioinfo-tools
module load trinity/2.4.0

Trinity --genome_guided_bam /home/emos8710/durian-analysis/analyses/13_tophat_RNA_align/accepted_hits.sorted.bam \
--max_memory 24G \
--genome_guided_max_intron 10000 \
--SS_lib_type FR \
--CPU 4 \
--output /home/emos8710/durian-analysis/analyses/14_trinity_RNA_assembly
