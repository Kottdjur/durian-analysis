#!/bin/bash -l

#SBATCH -A g2018003
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 7:00:00
#SBATCH -J tophat_RNA_alignment
#SBATCH --mail-type=ALL
#SBATCH --mail-user kottdjur@hotmail.com

module load bioinfo-tools
module load tophat/2.1.1

tophat -o /home/emos8710/durian-analysis/analyses/13_tophat_RNA_align \
/home/emos8710/durian-analysis/data/reference_scaffold06/reference_scaffold06 \
/home/emos8710/durian-analysis/data/scaffold06_link/RNA_trimmed_data/SRR6040092_scaffold_06.1.fastq.gz,\
/home/emos8710/durian-analysis/data/scaffold06_link/RNA_trimmed_data/SRR6040093_scaffold_06.1.fastq.gz,\
/home/emos8710/durian-analysis/data/scaffold06_link/RNA_trimmed_data/SRR6040094_scaffold_06.1.fastq.gz,\
/home/emos8710/durian-analysis/data/scaffold06_link/RNA_trimmed_data/SRR6040096_scaffold_06.1.fastq.gz,\
/home/emos8710/durian-analysis/data/scaffold06_link/RNA_trimmed_data/SRR6040097_scaffold_06.1.fastq.gz,\
/home/emos8710/durian-analysis/data/scaffold06_link/RNA_trimmed_data/SRR6156066_scaffold_06.1.fastq.gz,\
/home/emos8710/durian-analysis/data/scaffold06_link/RNA_trimmed_data/SRR6156067_scaffold_06.1.fastq.gz,\
/home/emos8710/durian-analysis/data/scaffold06_link/RNA_trimmed_data/SRR6156069_scaffold_06.1.fastq.gz,\
/home/emos8710/durian-analysis/analyses/05_trimmomatic_RNA/SRR6040095_trimmed_1P.fastq.gz \
/home/emos8710/durian-analysis/data/scaffold06_link/RNA_trimmed_data/SRR6040092_scaffold_06.2.fastq.gz,\
/home/emos8710/durian-analysis/data/scaffold06_link/RNA_trimmed_data/SRR6040093_scaffold_06.2.fastq.gz,\
/home/emos8710/durian-analysis/data/scaffold06_link/RNA_trimmed_data/SRR6040094_scaffold_06.2.fastq.gz,\
/home/emos8710/durian-analysis/data/scaffold06_link/RNA_trimmed_data/SRR6040096_scaffold_06.2.fastq.gz,\
/home/emos8710/durian-analysis/data/scaffold06_link/RNA_trimmed_data/SRR6040097_scaffold_06.2.fastq.gz,\
/home/emos8710/durian-analysis/data/scaffold06_link/RNA_trimmed_data/SRR6156066_scaffold_06.2.fastq.gz,\
/home/emos8710/durian-analysis/data/scaffold06_link/RNA_trimmed_data/SRR6156067_scaffold_06.2.fastq.gz,\
/home/emos8710/durian-analysis/data/scaffold06_link/RNA_trimmed_data/SRR6156069_scaffold_06.2.fastq.gz,\
/home/emos8710/durian-analysis/analyses/05_trimmomatic_RNA/SRR6040095_trimmed_2P.fastq.gz
