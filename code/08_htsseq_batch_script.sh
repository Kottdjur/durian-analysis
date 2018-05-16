#!/bin/bash -l

#SBATCH -A g2018003
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 2:00:00
#SBATCH -J htseq_read_count
#SBATCH --mail-type=ALL
#SBATCH --mail-user kottdjur@hotmail.com

module load bioinfo-tools
module load htseq/0.9.1

htseq-count -f bam -r pos -t gene -i ID -s no \
/home/emos8710/durian-analysis/analyses/13_tophat_RNA_align/root.bam \
/home/emos8710/durian-analysis/analyses/13_tophat_RNA_align/leaf.bam \
/home/emos8710/durian-analysis/analyses/13_tophat_RNA_align/aril.bam \
/home/emos8710/durian-analysis/analyses/13_tophat_RNA_align/stem.bam \
/home/emos8710/durian-analysis/data/maker_predictions/NW_0191683812E1.gff \
> /home/emos8710/durian-analysis/analyses/16_htsseq_read_count/htseq_MK_counts.out
