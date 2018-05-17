library("DESeq2")
library("pheatmap")
library("RColorBrewer")

# Load dataset
directory <- "/home/emmaostl/Documents/durian-analysis/analyses/16_htsseq_read_count/"
sampleFiles <- grep("MK", list.files(directory), value=TRUE)
sampleCondition <- c("aril","aril","aril","other","other","other")
sampleTable <- data.frame(sampleName = sampleFiles,
                          fileName = sampleFiles,
                          condition = sampleCondition)
ddsHTSeq <- DESeqDataSetFromHTSeqCount(sampleTable = sampleTable, 
                                       directory = directory,
                                       design = ~ condition)

# Remove genes with low counts
keep <- rowSums(counts(ddsHTSeq)) >= 10
ddsHTSeq <- ddsHTSeq[keep,]

# Perform differential expression analysis
dds <- DESeq(ddsHTSeq)
res <- results(dds, contrast=c("condition","aril","other"))
resOrdered <- res[order(res$pvalue),]
resOrdered
summary(res)

# Export results to csv
write.table(as.data.frame(res), file="/home/emmaostl/Documents/durian-analysis/analyses/17_deseq_dif_exp_analysis/DESeq2_results.csv", 
          sep="\t", quote=FALSE, col.names=NA)

# Number of genes with adjusted p-value < 0.05
sum(res$padj < 0.05, na.rm=TRUE)

# Plot
plotMA(res, alpha=0.05)

# Heatmaps
select <- order(rowMeans(counts(dds,normalized=TRUE)), decreasing=TRUE)[1:20]
df <- as.data.frame(colData(dds)[,c("condition","sizeFactor")])
pheatmap(assay(dds)[select,],cluster_rows=FALSE, show_rownames=FALSE, cluster_cols=FALSE, annotation_col=df)

sampleDists <- dist(t(assay(dds)))
sampleDistMatrix <- as.matrix(sampleDists)
rownames(sampleDistMatrix) <- paste(dds$condition)
colnames(sampleDistMatrix) <- NULL
colors <- colorRampPalette( rev(brewer.pal(9, "Blues")) )(255)
pheatmap(sampleDistMatrix,
         clustering_distance_rows=sampleDists,
         clustering_distance_cols=sampleDists,
         col=colors)
