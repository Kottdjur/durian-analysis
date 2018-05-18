import csv
import re

deseq_path = "H:/Dokument/durian-analysis/analyses/17_deseq_dif_exp_analysis/DESeq2_results.tsv"
eggnog_path = "H:/Dokument/durian-analysis/analyses/18_eggnog_functional_annotation/eggnog_maker_protein_annotations.tsv"

# Open DESeq output and save to array.
with open(deseq_path, "r") as deseq_file:
    tsvin = csv.reader(deseq_file, delimiter="\t")
    deseq_array = []

    tsvin.next()    # Skip column names

    for row in tsvin:
        for i in range(len(row)):
            if i != 0 and row[i] != "NA":
                row[i] = float(row[i])

        deseq_array.append(row)

deseq_file.close()

# Open eggNOG output and save to array.
with open(eggnog_path, "r") as eggnog_file:
    tsvin = csv.reader(eggnog_file, delimiter="\t")
    eggnog_array = []

    for row in tsvin:
        row[0] = re.sub("-mRNA-1$", "", row[0])
        eggnog_array.append(row)

eggnog_file.close()

# Take subset of statistically relevant genes
deseq_subset = [line for line in deseq_array if line[6] < 0.05]

# Sort the subset and eggnog annotations based on gene names
deseq_subset = sorted(deseq_subset, key=lambda x: x[0])
eggnog_array = sorted(eggnog_array, key=lambda x: x[0])

print "Subset"
for i in range(20):
    print deseq_subset[i]
print "eggNOG"
for i in range(100):
    print eggnog_array[i]

print "end"
combined = []
egg_inx = 0

for line in deseq_subset:
    deseq_name = line[0]
    eggnog_name = eggnog_array[egg_inx][0]
    match = False
    while not match:
        if deseq_name == eggnog_name:
            combined.append([deseq_name, line[6], eggnog_array[egg_inx][11], eggnog_array[egg_inx][12]])
            print len(combined)
            egg_inx += 1
            match = True
        else:
            egg_inx += 1
            eggnog_name = eggnog_array[egg_inx][0]
            match = False

print combined