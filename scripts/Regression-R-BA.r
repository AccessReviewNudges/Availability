

install.packages("ggplot2", repos="http://cran.us.r-project.org")
library(ggplot2)

ggplot <- function(...) ggplot2::ggplot(...) + 
scale_color_manual(values=c("#5acfc9", "#f3533a")) + 
scale_fill_manual(values=c("#5acfc9", "#f3533a"))

unlockBinding("ggplot",parent.env(asNamespace("GGally")))
assign("ggplot",ggplot,parent.env(asNamespace("GGally")))

# Put the path to the participants. It only needs the columns Group, BA, and R.
# We added some additional text in the figure by image editing.

review <- read.csv("PATH", header = TRUE, sep = ";")

png(filename="regression.png", 
	width = 1920, height = 1920,
	units = "px", pointsize = 12)

ggplot(review, aes(x = R, y = BA, color=Group)) + 
geom_point(size=7) +
geom_smooth(method="auto", se=FALSE, fullrange=FALSE, level=0.95, linewidth=3) +
geom_hline(yintercept = 0.944, linetype = "dashed", linewidth=3) +

geom_smooth(method="auto", se=FALSE, data=subset(review, BA>.944), linetype = "dashed", color="darkblue", linewidth=3) +
geom_smooth(method="auto", se=FALSE, data=subset(review, BA<.944), linetype = "dashed", color="darkblue", linewidth=3) +

theme_bw() +
theme(
    text = element_text(size = 70), 
    legend.position="top", 
    panel.grid.major.y = element_line(linewidth=3),
    panel.grid.minor.y = element_line(linewidth=3),
    panel.grid.major.x = element_line(linewidth=3),
    panel.grid.minor.x = element_line(linewidth=3)
)

