library("DESeq2")
directory <- "/home/emmaostl/Documents/durian-analysis/analyses/16_htsseq_read_count/"
sampleFiles <- grep("unstranded_trim", list.files(directory), value=TRUE)
#sampleCondition <- sub("(*stranded)*", "\\1", sampleFiles)
sampleTable <- data.frame(sampleName = sampleFiles,
                          fileName = sampleFiles)
dds <- DESeqDataSetFromHTSeqCount(sampleTable = sampleTable, 
                                  directory = directory,
                                  design = 1)
