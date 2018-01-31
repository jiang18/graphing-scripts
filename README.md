# Graphing Scripts in R

## 1) Hierarchical clustering with correlation matrix (R)
To group (either positively or negatively) correlated objects together, dist can be set as 1-abs(R). When choosing between wald.D and wald.D2, wald.D may be a better choice. As shown in [this page](http://www.analytictech.com/mb876/handouts/distance_and_correlation.htm), r=1-d^2/2n in the simplest case, where r is Pearson's correlation coefficient, d is Euclidean distance and n is sample size. Considering the difference between wald.D and wald.D2 (See [the discussion](https://stats.stackexchange.com/questions/109949/what-algorithm-does-ward-d-in-hclust-implement-if-it-is-not-wards-criterion)), wald.D may be appropriate because 1-abs(R) is comparable to squared form of d.  

Abs(R) can also be used as data directly; that is, we use the Euclidean distance, dist(abs(R)), and wald.D2 in hclust. This way generates the same clustering pattern as the wald.D approach aforementioned, for our data, genetic correlations of 35 traits.

Citation of the data or figure: available soon.
