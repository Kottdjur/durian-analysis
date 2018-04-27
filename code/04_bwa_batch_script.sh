#!/bin/bash -l

#SBATCH -A g2018003
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 4:00:00
#SBATCH -J bwa_illumina_DNA
#SBATCH --mail-type=ALL
#SBATCH --mail-user kottdjur@hotmail.com

module load bioinfo-tools
module load bwa/0.7.17

bwa mem -t 2 /home/emos8710/durian-analysis/analyses/01_canu_pacbio_DNA/durian_pacbio.contigs.fasta \
/home/emos8710/durian-analysis/data/unzipped_illumina/SRR6058604_scaffold_06.1P.fastq \
/home/emos8710/durian-analysis/data/unzipped_illumina/SRR6058604_scaffold_06.2P.fastq \
> /home/emos8710/durian-analysis/analyses/09_bwa_DNA/illumina_to_pacbio_align.sam
