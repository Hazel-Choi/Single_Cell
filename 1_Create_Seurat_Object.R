library(Seurat)

counts <- Read10X(data.dir="./DS1")
seurat <- CreateSeuratObject(counts,project="DS1")

library(Matrix)
counts <- readMM("./DS1/matrix.mtx.gz")
barcodes <- read.table("./DS1/barcodes.tsv.gz", stringsAsFactors=F)[,1]
features <- read.csv("./DS1/features.tsv.gz", stringsAsFactors=F, sep="\t", header=F)
rownames(counts) <- make.unique(features[,2])
colnames(counts) <- barcodes

seurat <- CreateSeuratObject(counts, project="DS1")
