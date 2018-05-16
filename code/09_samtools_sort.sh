#!/bin/bash -l

#SBATCH -A g2018003
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 1:00:00
#SBATCH -J samtools_sort
#SBATCH --mail-type=ALL
#SBATCH --mail-user kottdjur@hotmail.com

module load bioinfo-tools
module load samtools/1.6

samtools sort -T /home/emos8710/durian-analysis/analyses/13_tophat_RNA_align/accepted_hits_temp \
-n -o /home/emos8710/durian-analysis/analyses/13_tophat_RNA_align/accepted_hits.namesorted-2.bam \
-O bam /home/emos8710/durian-analysis/analyses/13_tophat_RNA_align/accepted_hits.bam

