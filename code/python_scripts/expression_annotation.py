# Combined DESeq2 and eggNOG results into a table with columns for:
# gene id,  adjusted p-val, COG functional category and annotation.

import csv
import re

deseq_path = "H:/Dokument/durian-analysis/analyses/17_deseq_dif_exp_analysis/DESeq2_results.tsv"
eggnog_path = "H:/Dokument/durian-analysis/analyses/18_eggnog_functional_annotation/eggnog_maker_protein_annotations.tsv"

# Open DESeq output and save to array.
with open(deseq_path, "rb") as deseq_file:
    tsvin = csv.reader(deseq_file, delimiter="\t")
    deseq_array = []

    tsvin.next()    # Skip column names

    for row in tsvin:
        row[0] = re.sub("^augustus_masked-NW_019168381.1-processed-gene-", "", row[0])
        for i in range(len(row)):
            if row[i] != "NA":
                row[i] = float(row[i])

        deseq_array.append(row)

deseq_file.close()

# Open eggNOG output and save to array.
with open(eggnog_path, "rb") as eggnog_file:
    tsvin = csv.reader(eggnog_file, delimiter="\t")
    eggnog_array = []

    for row in tsvin:
        row[0] = re.sub("-mRNA-1$", "", row[0])
        row[0] = re.sub("^augustus_masked-NW_019168381.1-processed-gene-", "", row[0])
        row[0] = float(row[0])
        eggnog_array.append(row)

eggnog_file.close()

# Take subset of statistically relevant genes
deseq_subset = [line for line in deseq_array if line[6] < 0.05]

# Sort the subset and eggnog annotations based on gene number
deseq_subset = sorted(deseq_subset, key=lambda x: x[0])
eggnog_array = sorted(eggnog_array, key=lambda x: x[0])

# Match annotation to genes
combined = []
egg_inx = 0

for line in deseq_subset:
    deseq_id = line[0]
    eggnog_id = eggnog_array[egg_inx][0]
    while deseq_id > eggnog_id:
        egg_inx += 1
        eggnog_id = eggnog_array[egg_inx][0]

    if deseq_id == eggnog_id and eggnog_array[egg_inx][12] != '':
        combined.append([deseq_id, line[6], line[2], eggnog_array[egg_inx][11], eggnog_array[egg_inx][12]])
        egg_inx += 1

combined = sorted(combined, key=lambda x: x[2])

writer = csv.writer(open("H:/Dokument/durian-analysis/analyses/significant_genes_foldchange.csv", 'wb'))
for line in combined:
    writer.writerow(line)
