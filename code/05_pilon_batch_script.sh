#!/bin/bash -l

#SBATCH -A g2018003
#SBATCH -p core
#SBATCH -n 6
#SBATCH -t 2:00:00
#SBATCH -J pilon_DNA_assembly_30GB
#SBATCH --mail-type=ALL
#SBATCH --mail-user kottdjur@hotmail.com

module load bioinfo-tools
module load Pilon/1.22

java -Xmx35G -jar $PILON_HOME/pilon.jar \
--genome /home/emos8710/durian-analysis/analyses/01_canu_pacbio_DNA/durian_pacbio.contigs.fasta \
--bam /home/emos8710/durian-analysis/analyses/09_bwa_DNA/illumina_to_pacbio_align.sorted.bam \
--output corrected_DNA \
--outdir /home/emos8710/durian-analysis/analyses/10_pilon_corrected_DNA/
