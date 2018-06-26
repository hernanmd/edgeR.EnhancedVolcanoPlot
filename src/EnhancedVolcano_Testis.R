
install.packages("devtools")
devtools::install_github("kevinblighe/EnhancedVolcano")
library("EnhancedVolcano")
# Set up working directory
setwd("/Users/mvs/Downloads")

#######DIET across TESTIS######################

# Import edgeR data
volcanodata <- read.table("volcanotes.txt", header=TRUE, sep="\t",dec = ",")
colnames(volcanodata)
# Set up edgeR compatible column names
colnames(volcanodata) <- c("Gene","pvalue","FC","FDR","absFC","logFC")
# Set transcript names as row names
row.names(volcanodata)<-make.names(volcanodata[,1], unique=TRUE)

EnhancedVolcanoEdgeR(
  volcanodata, 
  AdjustedCutoff = 0.05, 
  LabellingCutoff = 0.05, 
  FCCutoff = 2.0, 
  main = "EdgeR results", 
  col = c("grey30", "forestgreen", "royalblue", "red2"))

