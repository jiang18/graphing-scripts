library(factoextra)

R = read.table("trait_corr_mat.txt",head=T)
dist1 = as.dist(1-abs(R))
absR= abs(R)

par(mfrow=c(3,1))
hc1 = hclust(dist1, method = "ward.D2")
plot(hc1, main="Cluster Dendrogram of 35 Traits in Holstein Cattle", xlab="Dist=1-abs(R) & Method=ward.D2", sub="", cex.lab = 1.2, cex.main=1.5)
rect.hclust(hc1, k=3, border = c(4,2,3))
hc2 = hclust(dist1, method = "ward.D")
plot(hc2, main=NULL, xlab="Dist=1-abs(R) & Method=ward.D", sub="", cex.lab = 1.2)
rect.hclust(hc2, k=3, border = c(4,2,3))

# Use absR as data rather than 1-distance 
hc3 = hclust(dist(absR), method = "ward.D2")
plot(hc3, main=NULL, xlab="Dist=dist(abs(R)) & Method=ward.D2", sub="", cex.lab = 1.2)
rect.hclust(hc3, k=3, border = c(4,2,3))

# PCA Clusters from Hierarchical Clustering
sub_grp <- cutree(hc3, k = 3)
sub_grp[which(sub_grp == 1)] = "Production"
sub_grp[which(sub_grp == 2)] = "Reproduction"
sub_grp[which(sub_grp == 3)] = "Type"
pca_cluster = fviz_cluster(list(data = absR, cluster = sub_grp), title="PCA Clusters from Hierarchical Clustering of 35 Traits in Holstein Cattle")
pca_clster + theme(plot.title = element_text(size = rel(1.4))) + xlim(-4.3,5.7)
