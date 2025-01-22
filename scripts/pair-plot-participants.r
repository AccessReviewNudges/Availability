install.packages("GGally", repos="http://cran.us.r-project.org")
install.packages("ggforce", repos="http://cran.us.r-project.org")
library(GGally)
library(ggforce)

ggplot <- function(...) ggplot2::ggplot(...) + scale_color_manual(values=c("#5acfc9", "#f3533a")) + scale_fill_manual(values=c("#5acfc9", "#f3533a"))
unlockBinding("ggplot",parent.env(asNamespace("GGally")))
assign("ggplot",ggplot,parent.env(asNamespace("GGally")))

# Remove some columns from the participants data set so you have the same columns like in the figure in the paper.
# Set this file to calculate the figure.

studyData <- read.csv("PATH", header = TRUE, sep = ";")

png(filename="pair-plot.png", 
	width = 1920, height = 1551,
	units = "px", pointsize = 12)

ggpairs(studyData, 
	cardinality_threshold=NULL,
	ggplot2::aes(colour=Group), 
	upper = list(continuous = wrap("cor", method="spearman")), 
	lower=list(continuous=wrap(ggally_smooth_loess, se=FALSE)), 
	diag=list(continuous=wrap("barDiag")))