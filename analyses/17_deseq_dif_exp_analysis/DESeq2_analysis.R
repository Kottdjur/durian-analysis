library("DESeq2")
library("pheatmap")

# Load dataset
directory <- "/home/emmaostl/Documents/durian-analysis/analyses/16_htsseq_read_count/"
sampleFiles <- grep("MK", list.files(directory), value=TRUE)
sampleCondition <- c("aril","other","other","other")
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

plotMA(res, ylim=c(-8,8))

# Heatmap
select <- order(rowMeans(counts(dds,normalized=TRUE)), decreasing=TRUE)[1:20]
df <- as.data.frame(colData(dds)[,c("condition","sizeFactor")])
pheatmap(assay(dds)[select,],cluster_rows=FALSE, show_rownames=FALSE, cluster_cols=FALSE, annotation_col=df)
