seurat[["percent.mt"]] <- PercentageFeatureSet(seurat, pattern="^MT[-\\.]")

VlnPlot(seurat, features=c("nFeature_RNA", "nCount_RNA", "percent.mt"), ncol=3)
#or without dots
VlnPlot(seurat, features=c("nFeature_RNA", 'nCount_RNA", "percent.mt"), ncol=3, pt.size=0)

library(patchwork)
plot1 <- FeatureScatter(seurat, feature1 = "nCount_RNA", feature2="percent.mt")
plot2 <- FeatureScatter(seurat, feature1= "nCount_RNA", feature2="nFeature_RNA")
plot1 + plot2

seurat <- subset(seurat, subset = nFeature_RNA > 500 & nFeature_RNA < 5000 & percent.mt < 5)
