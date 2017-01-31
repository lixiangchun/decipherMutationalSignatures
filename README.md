## A pipeline to decipher mutational signatures operative in cancer 
Deciphering mutational signatures with alternative algorithms.

Mutational signature deciphering based on source code from previous publications (Alexandrov L. B. et al.) but provides
simpler command line to run. Besides, it provides several other algorithms. This program is binary code compiled via mcc,
so you can run it with MCR, which is freely available. This proggram is tested with MCR_R2013a.

1. Alexandrov LB, Nik-Zainal S, Wedge DC, et al: Deciphering signatures of mutational processes operative in human cancer. Cell Rep 3:246–59, 2013
2. Alexandrov LB, Nik-Zainal S, Wedge DC, et al: Signatures of mutational processes in human cancer. Nature 500:415–21, 2013

Check 'example.sh' to see how to run this program. The data files provided to run example.sh has been published in:

Li, X., Wu, W. K. K., Xing, R., Wong, S. H., & Liu, Y. (2016). Distinct subtypes of gastric cancer defined by molecular characterization include novel mutational signatures with prognostic capability. Cancer Research.

There is an 'output' directory produced when finished running example.sh, all of results are placed in this directory.

Specification of file format in the 'output':

1. parameter_index.txt - this file has three columns recorded stability and reconstruction error corresponding to every rank.
Users can select the optimal rank based on this file. An optimal rank can be identified if it's associated with high stability
and relatively low reconstruction error.

2. Rank_eq_%d.exposure.txt - Text file of matrix normalized H factorized from A for every rank examined (i.e. A ~ W * H).

3. Rank_eq_%d.processes.txt - Text file of matrix normalized W factorized from A for every rank examined (i.e. A ~ W * H).

## Prepare all input files
```R
library(cgat) ## Cancer Genome Analysis Toolkit (cgat), will be available on Github soon.
# maf.file is the annotated somatic mutations file format generated by oncotator by default.
prepareInputsForDecipherMutationalSignatures(maf.file, strand.bias=FALSE)
# If strand bias is desired.
prepareInputsForDecipherMutationalSignatures(maf.file, strand.bias=TRUE)
``` 

## Visualize mutational signatures within R
```R
library(cgat) ## Cancer Genome Analysis Toolkit (cgat), will be available on Github soon.
library(ggplot2)
# Not run: if the mutation signature is analysed by the matlab pipeline
fl <- "Rank_eq_3.processes.txt"
d <- read.table(fl, header=TRUE, stringsAsFactors=FALSE)
d <- lxctk::sortDataFrame(d, c("types","subtypes")) 
w <- d[,3:ncol(d)]
colnames(w) <- paste("Signature",1:ncol(w),sep="")

# w is the mutation signatures identified from NMF
p = plot_96_profile(w)
print(p)
     
# Or impose additional controls
ymax = 0.2
p = p + coord_cartesian(ylim=c(0,ymax)) # Set the upper bound of ylim
p = p + scale_y_continuous(breaks=seq(0, ymax, 0.05)) # scale y-axis with a step of 0.05

# Save to file
pdf.fig = "mutation_signature.pdf"
K <- ncol(w)
width <- 16
height <- ifelse(K==1,3,K*2)
pdf(file=pdf.fig,width=width,height=height)
p <- plot_96_profile(w, x.cex=2, scale=1.2)
print(p)
dev.off()
```

### For detail evaluation of the impact of different NMF algorithm on mutation signature deciphering results, please click [here](http://lixiangchun.github.io/msig/).

