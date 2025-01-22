install.packages("psych", repos="http://cran.us.r-project.org")
install.packages("rstatix", repos="http://cran.us.r-project.org")
library(psych)
library(rstatix)

# Put the path to the participants. Use only the columns: Group, ARP, t, R, BA, MD, TD, PF, and FL.

study <- read.csv("PATH", header = TRUE, sep = ";")

kruskal.test(study$ARP~study$Group)
kruskal.test(study$t~study$Group)
kruskal.test(study$R~study$Group)
kruskal.test(study$BA~study$Group)
kruskal.test(study$MD~study$Group)
kruskal.test(study$TD~study$Group)
kruskal.test(study$PF~study$Group)
kruskal.test(study$FL~study$Group)

dunn_test(ARP~Group, data=study, p.adjust.method = "bonferroni")
dunn_test(t~Group, data=study, p.adjust.method = "bonferroni")
dunn_test(R~Group, data=study, p.adjust.method = "bonferroni")
dunn_test(BA~Group, data=study, p.adjust.method = "bonferroni")
dunn_test(MD~Group, data=study, p.adjust.method = "bonferroni")
dunn_test(TD~Group, data=study, p.adjust.method = "bonferroni")
dunn_test(PF~Group, data=study, p.adjust.method = "bonferroni")
dunn_test(FL~Group, data=study, p.adjust.method = "bonferroni")


